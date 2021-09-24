import 'package:json_annotation/json_annotation.dart';
import '../../../../core/init/database/interface/IJsonModel.dart';

part 'bid_model.g.dart';

@JsonSerializable()
class BidModel extends IJsonModel<BidModel> {
  @JsonKey(name: 'bid_id')
  int? bidId;
  int? result;
  String? date;
  int? type;
  @JsonKey(name: 'bookmaker_id')
  int? bookmakerId;
  @JsonKey(name: 'sport_id')
  int? sportId;
  String? event;
  double amount;
  double rate;
  /*@JsonKey(ignore: true)
  double? paymentAmount;
  @JsonKey(ignore: true)
  double? balance;
  @JsonKey(ignore: true)
  double? profit;
  @JsonKey(ignore: true)
  double? roi;*/

  BidModel(
      {this.bidId,
      this.result,
      this.date,
      this.type,
      this.bookmakerId,
      this.sportId,
      this.event,
      this.amount = 0.0,
      this.rate = 0.0,
      });

  @override
  BidModel fromJson(Map<String, dynamic> json) {
    return _$BidModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BidModelToJson(this);
  }

  List<BidModel> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((item) => _$BidModelFromJson(item)).toList();
  }

  @override
  String toString() {
    return 'Bid {bidId: $bidId, result: $result, type: $type, date: $date, bookmakerId: $bookmakerId,'
        'sportId: $sportId, event: $event, amount: $amount, rate: $rate}';
  }
}
