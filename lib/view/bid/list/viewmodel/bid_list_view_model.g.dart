// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BidListViewModel on BidListViewModelBase, Store {
  Computed<double>? _$monthRoiComputed;

  @override
  double get monthRoi =>
      (_$monthRoiComputed ??= Computed<double>(() => super.monthRoi,
              name: 'BidListViewModelBase.monthRoi'))
          .value;

  final _$bidListAtom = Atom(name: 'BidListViewModelBase.bidList');

  @override
  List<BidModel> get bidList {
    _$bidListAtom.reportRead();
    return super.bidList;
  }

  @override
  set bidList(List<BidModel> value) {
    _$bidListAtom.reportWrite(value, super.bidList, () {
      super.bidList = value;
    });
  }

  final _$bidHeaderDateAtom = Atom(name: 'BidListViewModelBase.bidHeaderDate');

  @override
  Map<dynamic, dynamic> get bidHeaderDate {
    _$bidHeaderDateAtom.reportRead();
    return super.bidHeaderDate;
  }

  @override
  set bidHeaderDate(Map<dynamic, dynamic> value) {
    _$bidHeaderDateAtom.reportWrite(value, super.bidHeaderDate, () {
      super.bidHeaderDate = value;
    });
  }

  final _$bookmakerListAtom = Atom(name: 'BidListViewModelBase.bookmakerList');

  @override
  Map<dynamic, dynamic> get bookmakerList {
    _$bookmakerListAtom.reportRead();
    return super.bookmakerList;
  }

  @override
  set bookmakerList(Map<dynamic, dynamic> value) {
    _$bookmakerListAtom.reportWrite(value, super.bookmakerList, () {
      super.bookmakerList = value;
    });
  }

  final _$sportListAtom = Atom(name: 'BidListViewModelBase.sportList');

  @override
  Map<dynamic, dynamic> get sportList {
    _$sportListAtom.reportRead();
    return super.sportList;
  }

  @override
  set sportList(Map<dynamic, dynamic> value) {
    _$sportListAtom.reportWrite(value, super.sportList, () {
      super.sportList = value;
    });
  }

  final _$datePickerControllerAtom =
      Atom(name: 'BidListViewModelBase.datePickerController');

  @override
  DateRangePickerController get datePickerController {
    _$datePickerControllerAtom.reportRead();
    return super.datePickerController;
  }

  @override
  set datePickerController(DateRangePickerController value) {
    _$datePickerControllerAtom.reportWrite(value, super.datePickerController,
        () {
      super.datePickerController = value;
    });
  }

  final _$yearAtom = Atom(name: 'BidListViewModelBase.year');

  @override
  int get year {
    _$yearAtom.reportRead();
    return super.year;
  }

  @override
  set year(int value) {
    _$yearAtom.reportWrite(value, super.year, () {
      super.year = value;
    });
  }

  final _$monthAtom = Atom(name: 'BidListViewModelBase.month');

  @override
  int get month {
    _$monthAtom.reportRead();
    return super.month;
  }

  @override
  set month(int value) {
    _$monthAtom.reportWrite(value, super.month, () {
      super.month = value;
    });
  }

  final _$monthAmountAtom = Atom(name: 'BidListViewModelBase.monthAmount');

  @override
  double get monthAmount {
    _$monthAmountAtom.reportRead();
    return super.monthAmount;
  }

  @override
  set monthAmount(double value) {
    _$monthAmountAtom.reportWrite(value, super.monthAmount, () {
      super.monthAmount = value;
    });
  }

  final _$monthProfitAtom = Atom(name: 'BidListViewModelBase.monthProfit');

  @override
  double get monthProfit {
    _$monthProfitAtom.reportRead();
    return super.monthProfit;
  }

  @override
  set monthProfit(double value) {
    _$monthProfitAtom.reportWrite(value, super.monthProfit, () {
      super.monthProfit = value;
    });
  }

  final _$isPageLoadingAtom = Atom(name: 'BidListViewModelBase.isPageLoading');

  @override
  bool get isPageLoading {
    _$isPageLoadingAtom.reportRead();
    return super.isPageLoading;
  }

  @override
  set isPageLoading(bool value) {
    _$isPageLoadingAtom.reportWrite(value, super.isPageLoading, () {
      super.isPageLoading = value;
    });
  }

  final _$anchoredBannerAtom =
      Atom(name: 'BidListViewModelBase.anchoredBanner');

  @override
  BannerAd? get anchoredBanner {
    _$anchoredBannerAtom.reportRead();
    return super.anchoredBanner;
  }

  @override
  set anchoredBanner(BannerAd? value) {
    _$anchoredBannerAtom.reportWrite(value, super.anchoredBanner, () {
      super.anchoredBanner = value;
    });
  }

  final _$loadingAnchoredBannerAtom =
      Atom(name: 'BidListViewModelBase.loadingAnchoredBanner');

  @override
  bool get loadingAnchoredBanner {
    _$loadingAnchoredBannerAtom.reportRead();
    return super.loadingAnchoredBanner;
  }

  @override
  set loadingAnchoredBanner(bool value) {
    _$loadingAnchoredBannerAtom.reportWrite(value, super.loadingAnchoredBanner,
        () {
      super.loadingAnchoredBanner = value;
    });
  }

  final _$BidListViewModelBaseActionController =
      ActionController(name: 'BidListViewModelBase');

  @override
  double countPaymentAmount(BidModel model) {
    final _$actionInfo = _$BidListViewModelBaseActionController.startAction(
        name: 'BidListViewModelBase.countPaymentAmount');
    try {
      return super.countPaymentAmount(model);
    } finally {
      _$BidListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    final _$actionInfo = _$BidListViewModelBaseActionController.startAction(
        name: 'BidListViewModelBase.onSelectionChanged');
    try {
      return super.onSelectionChanged(args);
    } finally {
      _$BidListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMonth(int step) {
    final _$actionInfo = _$BidListViewModelBaseActionController.startAction(
        name: 'BidListViewModelBase.changeMonth');
    try {
      return super.changeMonth(step);
    } finally {
      _$BidListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$BidListViewModelBaseActionController.startAction(
        name: 'BidListViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$BidListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bidList: ${bidList},
bidHeaderDate: ${bidHeaderDate},
bookmakerList: ${bookmakerList},
sportList: ${sportList},
datePickerController: ${datePickerController},
year: ${year},
month: ${month},
monthAmount: ${monthAmount},
monthProfit: ${monthProfit},
isPageLoading: ${isPageLoading},
anchoredBanner: ${anchoredBanner},
loadingAnchoredBanner: ${loadingAnchoredBanner},
monthRoi: ${monthRoi}
    ''';
  }
}
