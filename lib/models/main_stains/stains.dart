import 'package:json_annotation/json_annotation.dart';
part 'stains.g.dart';

@JsonSerializable()
class Stains {
  final int? status;
  final String? message;
  @JsonKey(name: "staincategories")
  final List<StainCategories>? stainCategories;
  Stains({this.status, this.message, this.stainCategories});
  factory Stains.fromJson(Map<String, dynamic> json) => _$StainsFromJson(json);
  Map<String, dynamic> toJson() => _$StainsToJson(this);
}

@JsonSerializable()
class StainCategories {
  String stainName;
  String endpoint;
  StainCategories({required this.stainName, required this.endpoint});
  factory StainCategories.fromJson(Map<String, dynamic> json) =>
      _$StainCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$StainCategoriesToJson(this);
}
