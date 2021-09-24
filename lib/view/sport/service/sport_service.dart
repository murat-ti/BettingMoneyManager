import '../../_product/_db/query/db_query.dart';
import '../../_product/_model/sport_model.dart';
import '../../_product/_db/sport_db.dart';
import 'ISportService.dart';

class SportService extends ISportService {
  SportService() : super();

  @override
  Future<int?> insert(SportModel model) async {
    return await SportDb.instance.insert(model);
  }

  @override
  Future<SportModel?> get(int id) async {
    return await SportDb.instance.get(id);
  }

  @override
  Future<void> update(SportModel model) async {
    await SportDb.instance.update(model);
  }

  @override
  Future<void> remove(int id) async {
    await SportDb.instance.delete(id);
  }

  @override
  Future<List<SportModel>> fetchList(DbQuery query) async {
    final response = await SportDb.instance.fetchList(query);
    return response;
  }

  @override
  Future<void> reOrder(List<SportModel> list) async {
    await SportDb.instance.reOrder(list);
  }
}