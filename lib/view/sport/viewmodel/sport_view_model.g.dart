// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SportViewModel on SportViewModelBase, Store {
  final _$sportModelAtom = Atom(name: 'SportViewModelBase.sportModel');

  @override
  SportModel get sportModel {
    _$sportModelAtom.reportRead();
    return super.sportModel;
  }

  @override
  set sportModel(SportModel value) {
    _$sportModelAtom.reportWrite(value, super.sportModel, () {
      super.sportModel = value;
    });
  }

  final _$sportTitleAtom = Atom(name: 'SportViewModelBase.sportTitle');

  @override
  TextEditingController? get sportTitle {
    _$sportTitleAtom.reportRead();
    return super.sportTitle;
  }

  @override
  set sportTitle(TextEditingController? value) {
    _$sportTitleAtom.reportWrite(value, super.sportTitle, () {
      super.sportTitle = value;
    });
  }

  final _$sportListAtom = Atom(name: 'SportViewModelBase.sportList');

  @override
  List<SportModel> get sportList {
    _$sportListAtom.reportRead();
    return super.sportList;
  }

  @override
  set sportList(List<SportModel> value) {
    _$sportListAtom.reportWrite(value, super.sportList, () {
      super.sportList = value;
    });
  }

  final _$isPageLoadingAtom = Atom(name: 'SportViewModelBase.isPageLoading');

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
      Atom(name: 'SportViewModelBase.isPageLoadingLazyLoad');

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

  final _$_fetchAllAsyncAction = AsyncAction('SportViewModelBase._fetchAll');

  @override
  Future<void> _fetchAll() {
    return _$_fetchAllAsyncAction.run(() => super._fetchAll());
  }

  final _$fetchAllPaginationAsyncAction =
      AsyncAction('SportViewModelBase.fetchAllPagination');

  @override
  Future<void> fetchAllPagination(int index) {
    return _$fetchAllPaginationAsyncAction
        .run(() => super.fetchAllPagination(index));
  }

  final _$saveServiceAsyncAction =
      AsyncAction('SportViewModelBase.saveService');

  @override
  Future<void> saveService() {
    return _$saveServiceAsyncAction.run(() => super.saveService());
  }

  final _$removeServiceAsyncAction =
      AsyncAction('SportViewModelBase.removeService');

  @override
  Future<void> removeService(int index) {
    return _$removeServiceAsyncAction.run(() => super.removeService(index));
  }

  final _$onReorderAsyncAction = AsyncAction('SportViewModelBase.onReorder');

  @override
  Future<void> onReorder(int oldIndex, int newIndex) {
    return _$onReorderAsyncAction
        .run(() => super.onReorder(oldIndex, newIndex));
  }

  final _$setSportModelAsyncAction =
      AsyncAction('SportViewModelBase.setSportModel');

  @override
  Future<void> setSportModel(int index) {
    return _$setSportModelAsyncAction.run(() => super.setSportModel(index));
  }

  final _$SportViewModelBaseActionController =
      ActionController(name: 'SportViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$SportViewModelBaseActionController.startAction(
        name: 'SportViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$SportViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingLazyLoad() {
    final _$actionInfo = _$SportViewModelBaseActionController.startAction(
        name: 'SportViewModelBase._changeLoadingLazyLoad');
    try {
      return super._changeLoadingLazyLoad();
    } finally {
      _$SportViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sportModel: ${sportModel},
sportTitle: ${sportTitle},
sportList: ${sportList},
isPageLoading: ${isPageLoading},
isPageLoadingLazyLoad: ${isPageLoadingLazyLoad}
    ''';
  }
}
