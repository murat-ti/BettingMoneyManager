import '../../_product/_db/query/db_query.dart';
import '../../_product/_model/sport_model.dart';

abstract class ISportService{
  ISportService();

  Future<int?> insert(SportModel model);
  Future<SportModel?> get(int id);
  Future<void> update(SportModel model);
  Future<void> remove(int id);
  Future<List<SportModel>> fetchList(DbQuery query);
  Future<void> reOrder(List<SportModel> list);
}