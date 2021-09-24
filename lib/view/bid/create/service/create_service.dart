import '../../../_product/_db/sport_db.dart';
import '../../../_product/_model/sport_model.dart';
import '../../../_product/_db/bookmaker_db.dart';
import '../../../_product/_db/query/db_query.dart';
import '../../../_product/_model/bookmaker_model.dart';
import '../../../_product/_db/bid_db.dart';
import '../../../_product/_model/bid_model.dart';
import 'ICreateService.dart';

class CreateService extends ICreateService {
  CreateService() : super();

  @override
  Future<void> save(BidModel model) async {
    if(model.bidId != null) {
      await BidDb.instance.update(model);
    }
    else {
      await BidDb.instance.insert(model);
    }
  }

  @override
  Future<void> remove(int id) async {
    await BidDb.instance.delete(id);
  }

  @override
  Future<List<BookmakerModel>> fetchBookmakerList(DbQuery query) async {
    return await BookmakerDb.instance.fetchList(query);
  }
  @override
  Future<List<SportModel>> fetchSportList(DbQuery query) async {
    return await SportDb.instance.fetchList(query);
  }
}