import 'dart:io';
import 'package:betting_money_manager/core/constants/app/app_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../_product/_widgets/dialog/alert_datepicker.dart';
import '../../../_product/_db/query/bid_query.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../_product/class/extra_bid.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../_product/_model/bookmaker_model.dart';
import '../../../_product/_model/sport_model.dart';
import '../../../_product/_db/query/db_query.dart';
import '../service/IBidListService.dart';
import '../../../../core/constants/enums/date_time_enum.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../_product/_model/bid_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/model/base_view_model.dart';

part 'bid_list_view_model.g.dart';

class BidListViewModel = BidListViewModelBase with _$BidListViewModel;

abstract class BidListViewModelBase with Store, BaseViewModel, AlertDatepickerHelper {
  final IBidListService _service;
  String date = '';
  int showedIndex = -1;
  Map<int, String> showedDates = {};

  double monthTotalAmount = 0.00;
  double monthTotalPaymentAmount = 0.00;

  @observable
  List<BidModel> bidList = [];
  @observable
  Map bidHeaderDate = {};
  @observable
  Map bookmakerList = {};
  @observable
  Map sportList = {};
  @observable
  DateRangePickerController datePickerController = DateRangePickerController();
  @observable
  int year = DateTime.now().year;
  @observable
  int month = DateTime.now().month;

  @observable
  double monthAmount = 0;

  @observable
  double monthProfit = 0;

  @computed
  double get monthRoi => (monthAmount > 0) ? ((monthProfit / monthAmount) * 100) : 0.0;
  @observable
  bool isPageLoading = false;

  @observable
  BannerAd? anchoredBanner;
  @observable
  bool loadingAnchoredBanner = false;

  BidListViewModelBase(this._service);

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    datePickerController.displayDate = DateTime.now();
    _fetchAll();
    if (!loadingAnchoredBanner) {
      loadingAnchoredBanner = true;
      if(context != null) createAnchoredBanner(context!);
    }
  }

  @override
  void dispose() {
    anchoredBanner?.dispose();
  }

  Future<void> _fetchAll() async {
    _changeLoading();

    bidList = [];
    bidHeaderDate = {};

    monthTotalAmount = 0.00;
    monthTotalPaymentAmount = 0.00;
    date = '';
    showedIndex = -1;
    showedDates = {};

    await _fetchSelectList();
    var tempBidList = await _service.fetchList(BidQuery(year: year, month: month));
    var dailyTotalAmount = 0.0;
    var dailyTotalPaymentAmount = 0.0;
    var newDate = '';

    tempBidList.forEach((item) {
      if (item.date != null) {
        item.date = item.date!.dtFormat(DateTimeType.SERVER_DATE.format, DateTimeType.NOT_PARSED_DATE.format);
      }

      if (newDate != item.date) {
        dailyTotalAmount = 0.0;
        dailyTotalPaymentAmount = 0.0;
        newDate = item.date ?? '';
      }

      dailyTotalAmount += item.amount;
      monthTotalAmount += item.amount;
      dailyTotalPaymentAmount += (item.result == 0) ? item.amount * item.rate : 0.0;
      monthTotalPaymentAmount += (item.result == 0) ? item.amount * item.rate : 0.0;
      bidHeaderDate[item.date] = {'amount': dailyTotalAmount, 'paymentAmount': dailyTotalPaymentAmount};
      bidList.add(item);
    });
    monthAmount = monthTotalAmount;
    monthProfit = monthTotalPaymentAmount - monthTotalAmount;
    tempBidList = [];
    _changeLoading();
  }

  Future<void> _fetchSelectList() async {
    bookmakerList = {};
    sportList = {};
    bookmakerList = BookmakerModel().toList(await _service.fetchBookmakerList(DbQuery()));
    sportList = SportModel().toList(await _service.fetchSportList(DbQuery()));
  }

  @action
  double countPaymentAmount(BidModel model) {
    return (model.result == 0) ? (model.amount * model.rate) : 0.0;
  }

  Future<void> openPage(String route, {BidModel? data}) async {
    if (route == NavigationConstants.CREATE_VIEW) {
      await navigation.navigateToPage(
          path: route,
          data: ExtraBid(
              model: data,
              callback: () {
                _fetchAll();
              }));
    } else {
      await navigation.navigateToPage(path: route);
    }
  }

  @action
  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      var dateTemp = '';
      try {
        dateTemp = DateFormat(DateTimeType.SERVER_DATE.format).format(args.value).toString();
      } catch(e) {
        dateTemp = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
      }

      if(dateTemp.length == 10) {
        year = int.parse(dateTemp.substring(0,4));
        month = int.parse(dateTemp.substring(5,7));
        datePickerController.displayDate = DateTime(year, month, 01);
        _fetchAll();
      }
      if(context != null) Navigator.pop(context!);
    }
  }

  @action
  void changeMonth(int step) {
    if(step > 0) {
      if(month < 12) {
        month += 1;
      } else {
        month = 1;
        year += 1;
      }
    } else {
      if(month > 1) {
        month -= 1;
      } else {
        month = 12;
        year -= 1;
      }
    }
    _fetchAll();
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }

  Future<void> createAnchoredBanner(BuildContext context) async {
    final size = await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final banner = BannerAd(
      size: size,
      request: AdRequest(),
      adUnitId: Platform.isAndroid
          ? ApplicationConstants.ADMOB_ANDROID
          : ApplicationConstants.ADMOB_IOS,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          anchoredBanner = ad as BannerAd?;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }
}
