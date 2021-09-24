// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmaker_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookmakerViewModel on BookmakerViewModelBase, Store {
  final _$bookmakerModelAtom =
      Atom(name: 'BookmakerViewModelBase.bookmakerModel');

  @override
  BookmakerModel get bookmakerModel {
    _$bookmakerModelAtom.reportRead();
    return super.bookmakerModel;
  }

  @override
  set bookmakerModel(BookmakerModel value) {
    _$bookmakerModelAtom.reportWrite(value, super.bookmakerModel, () {
      super.bookmakerModel = value;
    });
  }

  final _$bookmakerTitleAtom =
      Atom(name: 'BookmakerViewModelBase.bookmakerTitle');

  @override
  TextEditingController? get bookmakerTitle {
    _$bookmakerTitleAtom.reportRead();
    return super.bookmakerTitle;
  }

  @override
  set bookmakerTitle(TextEditingController? value) {
    _$bookmakerTitleAtom.reportWrite(value, super.bookmakerTitle, () {
      super.bookmakerTitle = value;
    });
  }

  final _$bookmakerListAtom =
      Atom(name: 'BookmakerViewModelBase.bookmakerList');

  @override
  List<BookmakerModel> get bookmakerList {
    _$bookmakerListAtom.reportRead();
    return super.bookmakerList;
  }

  @override
  set bookmakerList(List<BookmakerModel> value) {
    _$bookmakerListAtom.reportWrite(value, super.bookmakerList, () {
      super.bookmakerList = value;
    });
  }

  final _$isPageLoadingAtom =
      Atom(name: 'BookmakerViewModelBase.isPageLoading');

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

  final _$isPageLoadingLazyLoadAtom =
      Atom(name: 'BookmakerViewModelBase.isPageLoadingLazyLoad');

  @override
  bool get isPageLoadingLazyLoad {
    _$isPageLoadingLazyLoadAtom.reportRead();
    return super.isPageLoadingLazyLoad;
  }

  @override
  set isPageLoadingLazyLoad(bool value) {
    _$isPageLoadingLazyLoadAtom.reportWrite(value, super.isPageLoadingLazyLoad,
        () {
      super.isPageLoadingLazyLoad = value;
    });
  }

  final _$_fetchAllAsyncAction =
      AsyncAction('BookmakerViewModelBase._fetchAll');

  @override
  Future<void> _fetchAll() {
    return _$_fetchAllAsyncAction.run(() => super._fetchAll());
  }

  final _$fetchAllPaginationAsyncAction =
      AsyncAction('BookmakerViewModelBase.fetchAllPagination');

  @override
  Future<void> fetchAllPagination(int index) {
    return _$fetchAllPaginationAsyncAction
        .run(() => super.fetchAllPagination(index));
  }

  final _$saveServiceAsyncAction =
      AsyncAction('BookmakerViewModelBase.saveService');

  @override
  Future<void> saveService() {
    return _$saveServiceAsyncAction.run(() => super.saveService());
  }

  final _$removeServiceAsyncAction =
      AsyncAction('BookmakerViewModelBase.removeService');

  @override
  Future<void> removeService(int index) {
    return _$removeServiceAsyncAction.run(() => super.removeService(index));
  }

  final _$onReorderAsyncAction =
      AsyncAction('BookmakerViewModelBase.onReorder');

  @override
  Future<void> onReorder(int oldIndex, int newIndex) {
    return _$onReorderAsyncAction
        .run(() => super.onReorder(oldIndex, newIndex));
  }

  final _$setBookmakerModelAsyncAction =
      AsyncAction('BookmakerViewModelBase.setBookmakerModel');

  @override
  Future<void> setBookmakerModel(int index) {
    return _$setBookmakerModelAsyncAction
        .run(() => super.setBookmakerModel(index));
  }

  final _$BookmakerViewModelBaseActionController =
      ActionController(name: 'BookmakerViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$BookmakerViewModelBaseActionController.startAction(
        name: 'BookmakerViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$BookmakerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingLazyLoad() {
    final _$actionInfo = _$BookmakerViewModelBaseActionController.startAction(
        name: 'BookmakerViewModelBase._changeLoadingLazyLoad');
    try {
      return super._changeLoadingLazyLoad();
    } finally {
      _$BookmakerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookmakerModel: ${bookmakerModel},
bookmakerTitle: ${bookmakerTitle},
bookmakerList: ${bookmakerList},
isPageLoading: ${isPageLoading},
isPageLoadingLazyLoad: ${isPageLoadingLazyLoad}
    ''';
  }
}
