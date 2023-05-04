import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/models/machine_wash/machine_wash.dart';
import 'package:newdemoproject/service/api_service.dart';

class MachineWashController extends GetxController {
  Rx<MachineWash> machineWash = MachineWash().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMachinWash();
  }

  Future<void> getMachinWash() async {
    isLoading.toggle();
    await RestClient(Dio()).getMachineWash().then((value) {
      isLoading.toggle();
      machineWash.value = value;
    }).catchError((Object object) {
      isLoading.toggle();
    });
  }
}
