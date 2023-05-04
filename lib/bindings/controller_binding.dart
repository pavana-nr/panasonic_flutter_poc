import 'package:get/instance_manager.dart';
import 'package:newdemoproject/controllers/water_consumption_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WaterConsumptionController>(WaterConsumptionController());
  }
}
