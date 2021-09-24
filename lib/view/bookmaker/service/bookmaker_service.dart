import '../../_product/_db/query/db_query.dart';
import '../../_product/_model/bookmaker_model.dart';
import '../../_product/_db/bookmaker_db.dart';
import 'IBookmakerService.dart';

class BookmakerService extends IBookmakerService {
  BookmakerService() : super();

  @override
  Future<int?> insert(BookmakerModel model) async {
    return await BookmakerDb.instance.insert(model);
  }

  @override
  Future<BookmakerModel?> get(int id) async {
    return await BookmakerDb.instance.get(id);
  }

  @override
  Future<void> update(BookmakerModel model) async {
    await BookmakerDb.instance.update(model);
  }

  @override
  Future<void> remove(int id) async {
    await BookmakerDb.instance.delete(id);
  }

  @override
  Future<List<BookmakerModel>> fetchList(DbQuery query) async {
    final response = await BookmakerDb.instance.fetchList(query);
    return response;
  }

  @override
  Future<void> reOrder(List<BookmakerModel> list) async {
    await BookmakerDb.instance.reOrder(list);
  }
}