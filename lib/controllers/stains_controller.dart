import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/models/main_stains/stains.dart';
import 'package:newdemoproject/service/api_service.dart';

class StainController extends GetxController {
  Rx<Stains> stains = Stains().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getStains();
  }

  Future<void> getStains() async {
    isLoading.toggle();
    await RestClient(Dio()).getStains().then((value) {
      isLoading.toggle();
      stains.value = value;
    }).catchError((Object object) {
      isLoading.toggle();
    });
  }

  void onSelectOption(int index) {
    Get.toNamed("/subStainCategories", arguments: [
      stains.value.stainCategories![index].stainName + ' Categories',
      stains.value.stainCategories![index].endpoint
    ]);
  }
}
