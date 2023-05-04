// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_stains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubStainsModel _$SubStainsModelFromJson(Map<String, dynamic> json) =>
    SubStainsModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      subStains: (json['data'] as List<dynamic>?)
          ?.map((e) => SubStains.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubStainsModelToJson(SubStainsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.subStains,
    };

SubStains _$SubStainsFromJson(Map<String, dynamic> json) => SubStains(
      preTreatmentGuide: (json['preTreatmentGuide'] as List<dynamic>?)
          ?.map((e) => PreTreatmentGuide.fromJson(e as Map<String, dynamic>))
          .toList(),
      stainTypes: json['stainTypes'] == null
          ? null
          : StainTypes.fromJson(json['stainTypes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubStainsToJson(SubStains instance) => <String, dynamic>{
      'preTreatmentGuide': instance.preTreatmentGuide,
      'stainTypes': instance.stainTypes,
    };

StainTypes _$StainTypesFromJson(Map<String, dynamic> json) => StainTypes(
      type: json['type'] as String?,
    );

Map<String, dynamic> _$StainTypesToJson(StainTypes instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

PreTreatmentGuide _$PreTreatmentGuideFromJson(Map<String, dynamic> json) =>
    PreTreatmentGuide(
      stepCount: json['stepCount'] as String?,
      stainImage: json['stainImage'] as String?,
      stainDescription: json['stainDescription'] as String?,
    );

Map<String, dynamic> _$PreTreatmentGuideToJson(PreTreatmentGuide instance) =>
    <String, dynamic>{
      'stepCount': instance.stepCount,
      'stainImage': instance.stainImage,
      'stainDescription': instance.stainDescription,
    };
