import 'package:json_annotation/json_annotation.dart';
import '../../../../core/init/database/interface/IJsonModel.dart';

part 'bookmaker_model.g.dart';

@JsonSerializable()
class BookmakerModel extends IJsonModel<BookmakerModel> {
  @JsonKey(name: 'bookmaker_id')
  int? bookmakerId;
  @JsonKey(name: 'bookmaker_title')
  String? bookmakerTitle;
  @JsonKey(name: 'bookmaker_order')
  int? bookmakerOrder;

  BookmakerModel({this.bookmakerId, this.bookmakerTitle, this.bookmakerOrder});

  @override
  BookmakerModel fromJson(Map<String, dynamic> json) {
    return _$BookmakerModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BookmakerModelToJson(this);
  }

  List<BookmakerModel> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((item) => _$BookmakerModelFromJson(item)).toList();
  }

  Map toList(List<BookmakerModel> list) {
    var resultList = {};

    list.forEach((item) {
      resultList[item.bookmakerId!] = item.bookmakerTitle ?? '';
    });

    return resultList;
  }

  @override
  String toString() {
    return 'Bookmaker {bookmakerId: $bookmakerId, bookmakerTitle: $bookmakerTitle, bookmakerOrder: $bookmakerOrder}';
  }
}