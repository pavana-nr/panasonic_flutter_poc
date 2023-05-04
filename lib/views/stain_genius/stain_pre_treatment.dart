import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/controllers/pre_treatment_controller.dart';
import 'package:newdemoproject/mixins/mixins.dart';
import 'package:newdemoproject/routes/router.dart';
import 'package:newdemoproject/utils/extensions.dart';
import 'package:newdemoproject/utils/styles.dart';
import 'package:newdemoproject/views/common_widgets/accordion.dart';
import 'package:newdemoproject/views/common_widgets/appbar.dart';
import 'package:newdemoproject/views/common_widgets/button_widget.dart';

class StainPretreatment extends StatelessWidget with ColorApp {
  final PreTreatmentController controller = Get.put(PreTreatmentController());
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(57.0),
            child: Appbar(
              title: 'Mix Stains',
            ),
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Pre-Treatment",
                      style: ThemeText.subHeading,
                    )),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                      "Pre-Treatment guides you with steps to weaken the stain before washing and ensures better stain removal"),
                ),
                Obx(() => Column(
                      children: controller.types.mapIndexed((element, idx) {
                        return Accordion(
                            title: element.stainTypes!.type!,
                            content: element.preTreatmentGuide!,
                            idx: idx,
                            isOpened: controller.openedAcoordion.value == idx);
                      }).toList(),
                    )),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text('Press "Next to proceed to wash cycle')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ButtonWidget(
                        path: "",
                        buttonName: "BACK",
                        buttonColor: ColorApp.whiteColor,
                        textColor: ColorApp.blackColor),
                    ButtonWidget(
                        path: Screens.machineWash,
                        buttonName: "NEXT",
                        buttonColor: ColorApp.blueColor,
                        textColor: ColorApp.whiteColor),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
