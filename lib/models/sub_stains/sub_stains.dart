import 'package:json_annotation/json_annotation.dart';
part 'sub_stains.g.dart';

@JsonSerializable()
class SubStainsModel {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final List<SubStains>? subStains;

  SubStainsModel({this.status, this.message, this.subStains});

  factory SubStainsModel.fromJson(Map<String, dynamic> json) =>
      _$SubStainsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubStainsModelToJson(this);
}

@JsonSerializable()
class SubStains {
  List<PreTreatmentGuide>? preTreatmentGuide;
  final StainTypes? stainTypes;

  SubStains({required this.preTreatmentGuide, required this.stainTypes});

  factory SubStains.fromJson(Map<String, dynamic> json) =>
      _$SubStainsFromJson(json);

  Map<String, dynamic> toJson() => _$SubStainsToJson(this);
}

@JsonSerializable()
class StainTypes {
  final String? type;

  StainTypes({required this.type});

  factory StainTypes.fromJson(Map<String, dynamic> json) =>
      _$StainTypesFromJson(json);

  Map<String, dynamic> toJson() => _$StainTypesToJson(this);
}

@JsonSerializable()
class PreTreatmentGuide {
  final String? stepCount;
  final String? stainImage;
  final String? stainDescription;

  PreTreatmentGuide({this.stepCount, this.stainImage, this.stainDescription});

  factory PreTreatmentGuide.fromJson(Map<String, dynamic> json) =>
      _$PreTreatmentGuideFromJson(json);

  Map<String, dynamic> toJson() => _$PreTreatmentGuideToJson(this);
}
