import '../../_product/_db/query/db_query.dart';
import '../../_product/_model/bookmaker_model.dart';
import '../service/IBookmakerService.dart';
import '../../../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'bookmaker_view_model.g.dart';

class BookmakerViewModel = BookmakerViewModelBase with _$BookmakerViewModel;

abstract class BookmakerViewModelBase with Store, BaseViewModel {
  final IBookmakerService _service;
  final VoidCallback _callback;
  int _page = 0;
  bool isLazyLoadDataFinish = false;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  GlobalKey<FormState> formState = GlobalKey();

  /*List<FocusNode> focusNodes = [];
  int totalNodes = 2;*/

  BookmakerViewModelBase(this._service, this._callback);

  @observable
  BookmakerModel bookmakerModel = BookmakerModel(bookmakerOrder: 1);
  @observable
  TextEditingController? bookmakerTitle = TextEditingController(text: '');
  @observable
  List<BookmakerModel> bookmakerList = [];
  @observable
  bool isPageLoading = false;
  @observable
  bool isPageLoadingLazyLoad = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    //bookmakerList = List.generate(100, (index) => 'Bookmaker ${index.toString()}');
    _fetchAll();
  }

  @action
  Future<void> _fetchAll() async {
    _changeLoading();
    bookmakerList = await _service.fetchList(DbQuery(page: _page));
    _changeLoading();
  }

  @action
  Future<void> fetchAllPagination(int index) async {
    if (index != bookmakerList.length - 1 || isLazyLoadDataFinish || isPageLoadingLazyLoad) return;

    _changeLoadingLazyLoad();
    //await Future.delayed(Duration(seconds: 3));

    final response = await _service.fetchList(DbQuery(page: _page + 1));
    if (response.isNotEmpty) {
      if (bookmakerList.isEmpty) {
        bookmakerList = response;
      } else if (response.last != bookmakerList.last) {
        bookmakerList.addAll(response);
        bookmakerList = bookmakerList;
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
      bookmakerModel.bookmakerTitle = bookmakerTitle!.text;
      if (bookmakerModel.bookmakerId != null && bookmakerModel.bookmakerId! > 0) {
        await _service.update(bookmakerModel);
        bookmakerList = bookmakerList;
      } else {
        //bookmakerModel.bookmakerOrder = (bookmakerList.isNotEmpty) ? (bookmakerList.last.bookmakerId ?? 0) + 1 : 1;
        var lastId = await _service.insert(bookmakerModel);
        if (lastId != null && lastId > 0) {
          bookmakerModel = await _service.get(lastId) ?? bookmakerModel;
          bookmakerList.add(bookmakerModel);
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
    if (bookmakerList[index].bookmakerId != null) {
      await _service.remove(bookmakerList[index].bookmakerId!);
      bookmakerList.removeAt(index);
      _callback();
    }
    _changeLoading();
  }

  @action
  Future<void> onReorder(int oldIndex, int newIndex) async {
    if (newIndex > bookmakerList.length) newIndex = bookmakerList.length;
    if (oldIndex < newIndex) newIndex -= 1;

    final element = bookmakerList.removeAt(oldIndex);
    bookmakerList.insert(newIndex, element);
    await _service.reOrder(bookmakerList);
    bookmakerList = bookmakerList;
    _callback();
  }

  @action
  Future<void> setBookmakerModel(int index) async {
    if (index >= 0) {
      bookmakerModel = bookmakerList.elementAt(index);
    } else {
      bookmakerModel = BookmakerModel(bookmakerTitle: '', bookmakerOrder: 1);
    }
    bookmakerTitle = TextEditingController(text: bookmakerModel.bookmakerTitle);
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
