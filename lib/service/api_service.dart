import 'package:newdemoproject/models/machine_wash/machine_wash.dart';
import 'package:newdemoproject/models/main_stains/stains.dart';
import 'package:newdemoproject/models/sub_stains/sub_stains.dart';
import 'package:newdemoproject/utils/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/all-stains")
  Future<Stains> getStains();

  @GET("/{path}")
  Future<SubStainsModel> getAllSubStains(@Path() String path);

  @GET("/machinewash")
  Future<MachineWash> getMachineWash();
}
