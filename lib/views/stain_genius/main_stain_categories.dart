import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/controllers/stains_controller.dart';
import 'package:newdemoproject/controllers/water_consumption_controller.dart';
import 'package:newdemoproject/views/common_widgets/stain_widget.dart';
import 'package:newdemoproject/views/water_consumption/water_consumption.dart';

class MainStainCategories extends StatelessWidget {
  final WaterConsumptionController waterController =
      Get.put(WaterConsumptionController());

  final StainController controller = Get.put(StainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0XFFf2f2f2),
      appBar: AppBar(
        title: Text("Stain Categories"),
      ),
      body: Obx(
        () => Column(
          children: [
            controller.isLoading.value == true
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: new Obx(
                    () => GridView.count(
                      crossAxisCount: 2,
                      children: new List<Widget>.generate(
                          controller.stains.value.stainCategories!.length,
                          (index) {
                        return GestureDetector(
                            child: StainWidget(
                                imageHeight: 80.0,
                                imageWidth: 80.0,
                                isSelected: false,
                                imageName: controller.stains.value
                                        .stainCategories![index].stainName +
                                    '.png',
                                stainName: controller.stains.value
                                    .stainCategories![index].stainName),
                            onTap: () => controller.onSelectOption(index));
                      }),
                    ),
                  )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const WaterConsumption());
          },
          child: const Icon(Icons.add)),
    ));
  }
}
