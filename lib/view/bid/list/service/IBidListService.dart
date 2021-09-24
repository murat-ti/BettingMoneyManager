import '../../../_product/_db/query/bid_query.dart';
import '../../../_product/_db/query/db_query.dart';
import '../../../_product/_model/bid_model.dart';
import '../../../_product/_model/bookmaker_model.dart';
import '../../../_product/_model/sport_model.dart';

abstract class IBidListService {
  IBidListService();

  Future<List<BidModel>> fetchList(BidQuery query);
  Future<List<BookmakerModel>> fetchBookmakerList(DbQuery query);
  Future<List<SportModel>> fetchSportList(DbQuery query);
}