import '../../_product/_db/query/db_query.dart';
import '../../_product/_model/sport_model.dart';
import '../service/ISportService.dart';
import '../../../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'sport_view_model.g.dart';

class SportViewModel = SportViewModelBase with _$SportViewModel;

abstract class SportViewModelBase with Store, BaseViewModel {
  final ISportService _service;
  final VoidCallback _callback;
  int _page = 0;
  bool isLazyLoadDataFinish = false;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  GlobalKey<FormState> formState = GlobalKey();

  /*List<FocusNode> focusNodes = [];
  int totalNodes = 2;*/

  SportViewModelBase(this._service, this._callback);

  @observable
  SportModel sportModel = SportModel(sportOrder: 1);
  @observable
  TextEditingController? sportTitle = TextEditingController(text: '');
  @observable
  List<SportModel> sportList = [];
  @observable
  bool isPageLoading = false;
  @observable
  bool isPageLoadingLazyLoad = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    //sportList = List.generate(100, (index) => 'Sport ${index.toString()}');
    _fetchAll();
  }

  @action
  Future<void> _fetchAll() async {
    _changeLoading();
    sportList = await _service.fetchList(DbQuery(page: _page));
    _changeLoading();
  }

  @action
  Future<void> fetchAllPagination(int index) async {
    if (index != sportList.length - 1 || isLazyLoadDataFinish || isPageLoadingLazyLoad) return;

    _changeLoadingLazyLoad();
    //await Future.delayed(Duration(seconds: 3));

    final response = await _service.fetchList(DbQuery(page: _page + 1));
    if (response.isNotEmpty) {
      if (sportList.isEmpty) {
        sportList = response;
      } else if (response.last != sportList.last) {
        sportList.addAll(response);
        sportList = sportList;
      }
      _page++;
    } else {
      isLazyLoadDataFinish = true;
    }

    _changeLoadingLazyLoad();
  }

  @action
  Future<void> saveService() async {
    _changeLoading();
    if (formState.currentState != null && formState.currentState!.validate()) {
      sportModel.sportTitle = sportTitle!.text;
      if (sportModel.sportId != null && sportModel.sportId! > 0) {
        await _service.update(sportModel);
        sportList = sportList;
      } else {
        //sportModel.sportOrder = (sportList.isNotEmpty) ? (sportList.last.sportId ?? 0) + 1 : 1;
        var lastId = await _service.insert(sportModel);
        if (lastId != null && lastId > 0) {
          sportModel = await _service.get(lastId) ?? sportModel;
          sportList.add(sportModel);
        }
      }
      _callback();
      Navigator.pop(context!);
    }
    _changeLoading();
  }

  @action
  Future<void> removeService(int index) async {
    _changeLoading();
    if (sportList[index].sportId != null) {
      await _service.remove(sportList[index].sportId!);
      sportList.removeAt(index);
      _callback();
    }
    _changeLoading();
  }

  @action
  Future<void> onReorder(int oldIndex, int newIndex) async {
    if (newIndex > sportList.length) newIndex = sportList.length;
    if (oldIndex < newIndex) newIndex -= 1;

    final element = sportList.removeAt(oldIndex);
    sportList.insert(newIndex, element);
    await _service.reOrder(sportList);
    sportList = sportList;
    _callback();
  }

  @action
  Future<void> setSportModel(int index) async {
    if (index >= 0) {
      sportModel = sportList.elementAt(index);
    } else {
      sportModel = SportModel(sportTitle: '', sportOrder: 1);
    }
    sportTitle = TextEditingController(text: sportModel.sportTitle);
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }

  @action
  void _changeLoadingLazyLoad() {
    isPageLoadingLazyLoad = !isPageLoadingLazyLoad;
  }
}
