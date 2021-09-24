import '../../../_product/_widgets/dialog/alert_selector.dart';

import '../../../_product/_widgets/dialog/alert_datepicker.dart';
import '../../../_product/class/extra_bid.dart';
import '../../../_product/_db/query/db_query.dart';
import '../../../_product/_model/bookmaker_model.dart';
import '../../../_product/_model/sport_model.dart';
import '../service/ICreateService.dart';
import '../../../../core/constants/enums/date_time_enum.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_model/bid_model.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../_product/_widgets/form/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/extension/string_extension.dart';

part 'create_view_model.g.dart';

class CreateViewModel = CreateViewModelBase with _$CreateViewModel;

abstract class CreateViewModelBase with Store, BaseViewModel, AlertDatepickerHelper, AlertSelectorHelper {
  final ICreateService _service;
  final ExtraBid _data;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController? event;
  TextEditingController? amount;
  TextEditingController? rate;

  List<FocusNode> focusNodes = [];
  int totalNodes = 3;

  @observable
  BidModel bidModel = BidModel(
    result: 0,
    type: 0,
    date: ''.dtNow(DateTimeType.SERVER_DATE.format),
    bookmakerId: 1,
    sportId: 1,
  );

  @observable
  List<BookmakerModel> bookmakerList = <BookmakerModel>[];

  @observable
  List<SportModel> sportList = <SportModel>[];

  @observable
  List<RadioModel> resultData = <RadioModel>[];

  @observable
  List<RadioModel> typeData = <RadioModel>[];

  @observable
  String bookmakerTitle = LocaleKeys.action_select.tr();

  @observable
  String sportTitle = LocaleKeys.action_select.tr();

  @observable
  bool isLoading = false;

  @computed
  DateTime get dateTime {
    var dateTime = ''.currentDate();
    var parts = bidModel.date!.split('-');
    if (parts.length >= 2) {
      var year = int.parse(parts[0].trim());
      var month = int.parse(parts[1].trim());
      var day = int.parse(parts[2].trim());
      dateTime = DateTime(year, month, day);
    }
    return dateTime;
  }

  CreateViewModelBase(this._service, this._data);

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    _initResultData();
    _initTypeData();
    _initFocusNodes();
    _initInputs();
    _fillBidModel();
  }

  Future<void> _fillBidModel() async{
    await _fetchSelectList();
    if(_data.model != null) {
      //change date format from 30.08.2021 => 2021-08-30
      if(_data.model!.date != null) {
        _data.model!.date = _data.model!.date!.dtFormat(DateTimeType.NOT_PARSED_DATE.format, DateTimeType.SERVER_DATE.format);
      }

      bidModel = _data.model!;

      await changeResult(bidModel.result!);
      await changeType(bidModel.type!);

      //set bookmaker title
      var bookmakerIndex = bookmakerList.indexWhere((item) => item.bookmakerId == bidModel.bookmakerId);
      if(bookmakerIndex > -1 && bookmakerList.isNotEmpty) {
        bookmakerTitle = bookmakerList[bookmakerIndex].bookmakerTitle ?? '';
      }

      //set sport title
      var sportIndex = sportList.indexWhere((item) => item.sportId == bidModel.sportId);
      if(sportIndex > -1 && sportList.isNotEmpty) {
        sportTitle = sportList[sportIndex].sportTitle ?? '';
      }

      event!.text = bidModel.event ?? '';
      amount!.text = (bidModel.amount > 0) ? bidModel.amount.toString() : '';
      rate!.text = (bidModel.rate > 0) ? bidModel.rate.toString() : '';
    }
  }

  void _initResultData() {
    resultData.add(RadioModel(bidModel.result == 0 ? true : false, LocaleKeys.bid_result_win.tr()));
    resultData.add(RadioModel(bidModel.result == 1 ? true : false, LocaleKeys.bid_result_lose.tr()));
  }

  void _initTypeData() {
    typeData.add(RadioModel(bidModel.type == 0 ? true : false, LocaleKeys.bid_bid_type_pre.tr()));
    typeData.add(RadioModel(bidModel.type == 1 ? true : false, LocaleKeys.bid_bid_type_live.tr()));
  }

  void _initFocusNodes() async{
    focusNodes.clear();
    for (var i = 0; i < totalNodes; i++) {
      focusNodes.add(FocusNode());
    }
  }

  Future<void> setFocusNode(int focusNodeIndex) async {
    if (scaffoldState.currentContext != null) {
      FocusScope.of(scaffoldState.currentContext!).unfocus();
      if (focusNodeIndex <= totalNodes) {
        await Future.delayed(Duration(milliseconds: 500), () {});
        FocusScope.of(scaffoldState.currentContext!).requestFocus(focusNodes[focusNodeIndex]);
      }
    }
  }

  void _initInputs() {
    event = TextEditingController(text: (bidModel.event != null) ? bidModel.event : '');
    amount = TextEditingController(text: (bidModel.amount > 0) ? bidModel.amount.toString() : '');
    rate = TextEditingController(text: (bidModel.rate > 0) ? bidModel.rate.toString() : '');
  }

  Future<void> _fetchSelectList() async {
      bookmakerList = await _service.fetchBookmakerList(DbQuery());
      sportList = await _service.fetchSportList(DbQuery());
  }

  @action
  Future<void> changeResult(int index) async {
    //if (index != bidModel.result) {
      bidModel.result = index;
      resultData.forEach((element) => element.isSelected = false);
      resultData[index].isSelected = true;
      resultData = resultData;
    //}
  }

  @action
  Future<void> changeType(int index) async {
    //if (index != bidModel.type) {
      bidModel.type = index;
      typeData.forEach((element) => element.isSelected = false);
      typeData[index].isSelected = true;
      typeData = typeData;
    //}
  }

  @action
  Future<void> changeBookmaker(BookmakerModel? model) async {
    if (model != null) {
      bidModel.bookmakerId = model.bookmakerId;
      bookmakerTitle = model.bookmakerTitle ?? '';
    }
  }

  @action
  Future<void> changeSport(SportModel? model) async {
    if (model != null) {
      bidModel.sportId = model.sportId;
      sportTitle = model.sportTitle ?? '';
    }
  }

  /*@action
  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      print('date on changed');
    }
  }*/

  @action
  void dateChanged(DateTime value) {
    bidModel.date = DateFormat(DateTimeType.SERVER_DATE.format).format(value).toString();
    bidModel = bidModel;
  }

  @action
  Future<void> saveService() async {
    isLoadingChange();
    if (formState.currentState != null && formState.currentState!.validate()) {
      await fillFromFormModel();
      await _service.save(bidModel);
      _data.callback();
      Navigator.pop(context!);
    }
    isLoadingChange();
  }

  @action
  Future<void> removeService() async {
    if(_data.model != null && _data.model!.bidId != null && _data.model!.bidId! > 0) {
      await _service.remove(_data.model!.bidId!);
      _data.callback();
      Navigator.pop(context!);
    }
  }

  Future<void> fillFromFormModel() async {
    bidModel.event = event!.text;
    bidModel.amount = double.parse(amount?.text ?? '0.00');
    bidModel.rate = double.parse(rate?.text ?? '0.00');
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  Future<void> openPage(String route) async {
    await navigation.navigateToPage(path: route, data: () { _fetchSelectList(); });
  }
}
