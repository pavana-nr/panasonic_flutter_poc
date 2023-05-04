import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/controllers/sub_stains_controller.dart';
import 'package:newdemoproject/mixins/mixins.dart';
import 'package:newdemoproject/utils/styles.dart';
import 'package:newdemoproject/views/common_widgets/appbar.dart';
import 'package:newdemoproject/views/common_widgets/stain_widget.dart';

class SubStainCategories extends StatefulWidget with ColorApp {
  @override
  State<SubStainCategories> createState() => _SubStainCategoriesState();
}

class _SubStainCategoriesState extends State<SubStainCategories> {
  final SubStainController controller = Get.put(SubStainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0XFFf2f2f2),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57.0),
        child: Obx(() => Appbar(title: controller.pageTitle.value)),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "For mix stain types you can select multiple stains from below:",
                    style: ThemeText.subHeading),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: controller.isLoading.value == true
                    ? Center(child: CircularProgressIndicator())
                    : new GridView.count(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        crossAxisCount: 3,
                        children: new List<Widget>.generate(
                            controller.subStainsModel.value.subStains!.length,
                            (index) {
                          String type = controller.subStainsModel.value
                              .subStains![index].stainTypes!.type!;
                          return Obx(() => GestureDetector(
                              child: StainWidget(
                                  imageHeight: 40.0,
                                  imageWidth: 40.0,
                                  imageName: 'Beverages.png',
                                  stainName: type,
                                  isSelected: controller.selectedItem.value
                                      .contains(type)),
                              onTap: () {
                                controller.doMultipleSelection(controller
                                    .subStainsModel
                                    .value
                                    .subStains![index]
                                    .stainTypes!
                                    .type!);
                              }));
                        }),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "BACK",
                        style: TextStyle(color: ColorApp.blackColor),
                      ),
                    ),
                  ),
                  controller.nextEnabled.value
                      ? Container(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: () {
                              controller
                                  .onClickNext(controller.selectedItem.value);
                            },
                            child: Text("NEXT"),
                          ),
                        )
                      : SizedBox(
                          width: 2,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
