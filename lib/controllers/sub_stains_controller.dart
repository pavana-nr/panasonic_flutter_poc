import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/models/sub_stains/sub_stains.dart';
import 'package:newdemoproject/routes/router.dart';
import 'package:newdemoproject/service/api_service.dart';

class SubStainController extends GetxController {
  Rx<SubStainsModel> subStainsModel = SubStainsModel().obs;

  RxBool isLoading = false.obs;
  RxBool nextEnabled = false.obs;
  RxString pageTitle = "".obs;
  RxString endPoint = "".obs;
  Rx<HashSet> selectedItem = HashSet().obs;

  @override
  void onInit() {
    var data = Get.arguments;
    if (data != null) {
      try {
        data = data as List<String>;
        pageTitle.value = data[0];
        endPoint.value = data[1];
        getAllSubStains(path: endPoint.value);
      } catch (e, stack) {
        print(e.toString());
        print(stack.toString());
      }
    }
    super.onInit();
  }

  void doMultipleSelection(String path) {
    if (selectedItem.value.contains(path)) {
      selectedItem.value.remove(path);
    } else {
      selectedItem.value.add(path);
    }
    selectedItem.refresh();
    if (selectedItem.value.isNotEmpty) {
      nextEnabled.value = true;
    } else {
      nextEnabled.value = false;
    }
  }

  Future<void> getAllSubStains({required String path}) async {
    isLoading.toggle();
    await RestClient(Dio()).getAllSubStains(path).then((value) {
      isLoading.toggle();
      subStainsModel.value = value;
    }).catchError((Object object) {
      isLoading.toggle();
    });
  }

  void onClickNext(HashSet selectedItem) {
    List<SubStains> list = [];
    for (var item in selectedItem) {
      final foundItem = subStainsModel.value.subStains!
          .firstWhere((element) => element.stainTypes!.type == item);
      list.add(foundItem);
    }
    Get.toNamed(Screens.preTreatment, arguments: list);
  }
}
