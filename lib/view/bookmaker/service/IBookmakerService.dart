import '../../_product/_db/query/db_query.dart';
import '../../_product/_model/bookmaker_model.dart';

abstract class IBookmakerService{
  IBookmakerService();

  Future<int?> insert(BookmakerModel model);
  Future<BookmakerModel?> get(int id);
  Future<void> update(BookmakerModel model);
  Future<void> remove(int id);
  Future<List<BookmakerModel>> fetchList(DbQuery query);
  Future<void> reOrder(List<BookmakerModel> list);
}