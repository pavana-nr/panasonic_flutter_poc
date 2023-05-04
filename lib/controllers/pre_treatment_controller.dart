import 'package:get/get.dart';
import 'package:newdemoproject/models/sub_stains/sub_stains.dart';

class PreTreatmentController extends GetxController {
  RxList<SubStains> types = <SubStains>[].obs;
  RxInt openedAcoordion = (-1).obs;

  @override
  void onInit() {
    var data = Get.arguments;
    if (data != null) {
      try {
        data = data as List<SubStains>;
        types.value = data;
      } catch (e, stack) {
        print(e.toString());
        print(stack.toString());
      }
    }
    super.onInit();
  }

  void onClickOpen(int index, bool isOpened) {
    if (isOpened) {
      openedAcoordion.value = -1;
    } else {
      openedAcoordion.value = index;
    }
  }
}
