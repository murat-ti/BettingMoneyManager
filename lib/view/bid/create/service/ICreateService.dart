import '../../../_product/_model/sport_model.dart';
import '../../../_product/_model/bookmaker_model.dart';
import '../../../_product/_db/query/db_query.dart';
import '../../../_product/_model/bid_model.dart';

abstract class ICreateService{
  ICreateService();

  Future<void> save(BidModel model);
  Future<void> remove(int id);
  Future<List<BookmakerModel>> fetchBookmakerList(DbQuery query);
  Future<List<SportModel>> fetchSportList(DbQuery query);
}