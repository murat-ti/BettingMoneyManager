import 'package:json_annotation/json_annotation.dart';
import '../../../../core/init/database/interface/IJsonModel.dart';

part 'sport_model.g.dart';

@JsonSerializable()
class SportModel extends IJsonModel<SportModel> {
  @JsonKey(name: 'sport_id')
  int? sportId;
  @JsonKey(name: 'sport_title')
  String? sportTitle;
  @JsonKey(name: 'sport_order')
  int? sportOrder;

  SportModel({this.sportId, this.sportTitle, this.sportOrder});

  @override
  SportModel fromJson(Map<String, dynamic> json) {
    return _$SportModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SportModelToJson(this);
  }

  List<SportModel> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((item) => _$SportModelFromJson(item)).toList();
  }

  Map toList(List<SportModel> list) {
    var resultList = {};

    list.forEach((item) {
      resultList[item.sportId!] = item.sportTitle ?? '';
    });

    return resultList;
  }

  @override
  String toString() {
    return 'Sport {sportId: $sportId, sportTitle: $sportTitle, sportOrder: $sportOrder}';
  }
}