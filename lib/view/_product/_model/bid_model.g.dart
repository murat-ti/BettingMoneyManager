// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BidModel _$BidModelFromJson(Map<String, dynamic> json) {
  return BidModel(
    bidId: json['bid_id'] as int?,
    result: json['result'] as int?,
    date: json['date'] as String?,
    type: json['type'] as int?,
    bookmakerId: json['bookmaker_id'] as int?,
    sportId: json['sport_id'] as int?,
    event: json['event'] as String?,
    amount: (json['amount'] as num).toDouble(),
    rate: (json['rate'] as num).toDouble(),
  );
}

Map<String, dynamic> _$BidModelToJson(BidModel instance) => <String, dynamic>{
      'bid_id': instance.bidId,
      'result': instance.result,
      'date': instance.date,
      'type': instance.type,
      'bookmaker_id': instance.bookmakerId,
      'sport_id': instance.sportId,
      'event': instance.event,
      'amount': instance.amount,
      'rate': instance.rate,
    };
