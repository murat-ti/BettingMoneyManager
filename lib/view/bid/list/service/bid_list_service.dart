import '../../../_product/_db/query/bid_query.dart';
import '../../../_product/_db/sport_db.dart';
import '../../../_product/_model/sport_model.dart';
import '../../../_product/_db/bookmaker_db.dart';
import '../../../_product/_db/query/db_query.dart';
import '../../../_product/_model/bookmaker_model.dart';
import '../../../_product/_db/bid_db.dart';
import '../../../_product/_model/bid_model.dart';
import 'IBidListService.dart';

class BidListService extends IBidListService {
  BidListService() : super();

  @override
  Future<List<BidModel>> fetchList(BidQuery query) async {
    return await BidDb.instance.fetchList(query);
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