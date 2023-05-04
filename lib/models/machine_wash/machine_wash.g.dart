// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_wash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineWash _$MachineWashFromJson(Map<String, dynamic> json) => MachineWash(
      status: json['status'] as int?,
      message: json['message'] as String?,
      machineWash: (json['machinewashes'] as List<dynamic>?)
          ?.map((e) => MachineWashData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MachineWashToJson(MachineWash instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'machinewashes': instance.machineWash,
    };

MachineWashData _$MachineWashDataFromJson(Map<String, dynamic> json) =>
    MachineWashData(
      clothType: json['clothType'] as String,
      runTime: json['runTime'] as String,
      celcius: json['celcius'] as String,
      rpm: json['rpm'] as String,
      spin: json['spin'] as String,
      dryness: json['dryness'] as String,
    );

Map<String, dynamic> _$MachineWashDataToJson(MachineWashData instance) =>
    <String, dynamic>{
      'clothType': instance.clothType,
      'runTime': instance.runTime,
      'celcius': instance.celcius,
      'rpm': instance.rpm,
      'spin': instance.spin,
      'dryness': instance.dryness,
    };
