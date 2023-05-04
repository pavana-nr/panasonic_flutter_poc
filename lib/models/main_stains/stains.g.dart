// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stains _$StainsFromJson(Map<String, dynamic> json) => Stains(
      status: json['status'] as int?,
      message: json['message'] as String?,
      stainCategories: (json['staincategories'] as List<dynamic>?)
          ?.map((e) => StainCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StainsToJson(Stains instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'staincategories': instance.stainCategories,
    };

StainCategories _$StainCategoriesFromJson(Map<String, dynamic> json) =>
    StainCategories(
      stainName: json['stainName'] as String,
      endpoint: json['endpoint'] as String,
    );

Map<String, dynamic> _$StainCategoriesToJson(StainCategories instance) =>
    <String, dynamic>{
      'stainName': instance.stainName,
      'endpoint': instance.endpoint,
    };
