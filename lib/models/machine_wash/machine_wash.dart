import 'package:json_annotation/json_annotation.dart';
part 'machine_wash.g.dart';

@JsonSerializable()
class MachineWash {
  final int? status;
  final String? message;
  @JsonKey(name: "machinewashes")
  final List<MachineWashData>? machineWash;
  MachineWash({this.status, this.message, this.machineWash});
  factory MachineWash.fromJson(Map<String, dynamic> json) =>
      _$MachineWashFromJson(json);
  Map<String, dynamic> toJson() => _$MachineWashToJson(this);
}

@JsonSerializable()
class MachineWashData {
  String clothType;
  String runTime;
  String celcius;
  String rpm;
  String spin;
  String dryness;
  MachineWashData(
      {required this.clothType,
      required this.runTime,
      required this.celcius,
      required this.rpm,
      required this.spin,
      required this.dryness});
  factory MachineWashData.fromJson(Map<String, dynamic> json) =>
      _$MachineWashDataFromJson(json);
  Map<String, dynamic> toJson() => _$MachineWashDataToJson(this);
}
