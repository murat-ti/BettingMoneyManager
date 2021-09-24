// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmaker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmakerModel _$BookmakerModelFromJson(Map<String, dynamic> json) {
  return BookmakerModel(
    bookmakerId: json['bookmaker_id'] as int?,
    bookmakerTitle: json['bookmaker_title'] as String?,
    bookmakerOrder: json['bookmaker_order'] as int?,
  );
}

Map<String, dynamic> _$BookmakerModelToJson(BookmakerModel instance) =>
    <String, dynamic>{
      'bookmaker_id': instance.bookmakerId,
      'bookmaker_title': instance.bookmakerTitle,
      'bookmaker_order': instance.bookmakerOrder,
    };
