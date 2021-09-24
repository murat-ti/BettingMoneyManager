// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateViewModel on CreateViewModelBase, Store {
  Computed<DateTime>? _$dateTimeComputed;

  @override
  DateTime get dateTime =>
      (_$dateTimeComputed ??= Computed<DateTime>(() => super.dateTime,
              name: 'CreateViewModelBase.dateTime'))
          .value;

  final _$bidModelAtom = Atom(name: 'CreateViewModelBase.bidModel');

  @override
  BidModel get bidModel {
    _$bidModelAtom.reportRead();
    return super.bidModel;
  }

  @override
  set bidModel(BidModel value) {
    _$bidModelAtom.reportWrite(value, super.bidModel, () {
      super.bidModel = value;
    });
  }

  final _$bookmakerListAtom = Atom(name: 'CreateViewModelBase.bookmakerList');

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

  final _$sportListAtom = Atom(name: 'CreateViewModelBase.sportList');

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

  final _$resultDataAtom = Atom(name: 'CreateViewModelBase.resultData');

  @override
  List<RadioModel> get resultData {
    _$resultDataAtom.reportRead();
    return super.resultData;
  }

  @override
  set resultData(List<RadioModel> value) {
    _$resultDataAtom.reportWrite(value, super.resultData, () {
      super.resultData = value;
    });
  }

  final _$typeDataAtom = Atom(name: 'CreateViewModelBase.typeData');

  @override
  List<RadioModel> get typeData {
    _$typeDataAtom.reportRead();
    return super.typeData;
  }

  @override
  set typeData(List<RadioModel> value) {
    _$typeDataAtom.reportWrite(value, super.typeData, () {
      super.typeData = value;
    });
  }

  final _$bookmakerTitleAtom = Atom(name: 'CreateViewModelBase.bookmakerTitle');

  @override
  String get bookmakerTitle {
    _$bookmakerTitleAtom.reportRead();
    return super.bookmakerTitle;
  }

  @override
  set bookmakerTitle(String value) {
    _$bookmakerTitleAtom.reportWrite(value, super.bookmakerTitle, () {
      super.bookmakerTitle = value;
    });
  }

  final _$sportTitleAtom = Atom(name: 'CreateViewModelBase.sportTitle');

  @override
  String get sportTitle {
    _$sportTitleAtom.reportRead();
    return super.sportTitle;
  }

  @override
  set sportTitle(String value) {
    _$sportTitleAtom.reportWrite(value, super.sportTitle, () {
      super.sportTitle = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'CreateViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$changeResultAsyncAction =
      AsyncAction('CreateViewModelBase.changeResult');

  @override
  Future<void> changeResult(int index) {
    return _$changeResultAsyncAction.run(() => super.changeResult(index));
  }

  final _$changeTypeAsyncAction = AsyncAction('CreateViewModelBase.changeType');

  @override
  Future<void> changeType(int index) {
    return _$changeTypeAsyncAction.run(() => super.changeType(index));
  }

  final _$changeBookmakerAsyncAction =
      AsyncAction('CreateViewModelBase.changeBookmaker');

  @override
  Future<void> changeBookmaker(BookmakerModel? model) {
    return _$changeBookmakerAsyncAction.run(() => super.changeBookmaker(model));
  }

  final _$changeSportAsyncAction =
      AsyncAction('CreateViewModelBase.changeSport');

  @override
  Future<void> changeSport(SportModel? model) {
    return _$changeSportAsyncAction.run(() => super.changeSport(model));
  }

  final _$saveServiceAsyncAction =
      AsyncAction('CreateViewModelBase.saveService');

  @override
  Future<void> saveService() {
    return _$saveServiceAsyncAction.run(() => super.saveService());
  }

  final _$removeServiceAsyncAction =
      AsyncAction('CreateViewModelBase.removeService');

  @override
  Future<void> removeService() {
    return _$removeServiceAsyncAction.run(() => super.removeService());
  }

  final _$CreateViewModelBaseActionController =
      ActionController(name: 'CreateViewModelBase');

  @override
  void dateChanged(DateTime value) {
    final _$actionInfo = _$CreateViewModelBaseActionController.startAction(
        name: 'CreateViewModelBase.dateChanged');
    try {
      return super.dateChanged(value);
    } finally {
      _$CreateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingChange() {
    final _$actionInfo = _$CreateViewModelBaseActionController.startAction(
        name: 'CreateViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$CreateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bidModel: ${bidModel},
bookmakerList: ${bookmakerList},
sportList: ${sportList},
resultData: ${resultData},
typeData: ${typeData},
bookmakerTitle: ${bookmakerTitle},
sportTitle: ${sportTitle},
isLoading: ${isLoading},
dateTime: ${dateTime}
    ''';
  }
}
