// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SportModel _$SportModelFromJson(Map<String, dynamic> json) {
  return SportModel(
    sportId: json['sport_id'] as int?,
    sportTitle: json['sport_title'] as String?,
    sportOrder: json['sport_order'] as int?,
  );
}

Map<String, dynamic> _$SportModelToJson(SportModel instance) =>
    <String, dynamic>{
      'sport_id': instance.sportId,
      'sport_title': instance.sportTitle,
      'sport_order': instance.sportOrder,
    };
