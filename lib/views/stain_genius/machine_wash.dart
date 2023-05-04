import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/controllers/machine_wash_conroller.dart';
import 'package:newdemoproject/mixins/mixins.dart';
import 'package:newdemoproject/routes/router.dart';
import 'package:newdemoproject/utils/styles.dart';
import 'package:newdemoproject/views/common_widgets/appbar.dart';

class MachineWash extends StatelessWidget with ColorApp {
  MachineWash({Key? key}) : super(key: key);
  final MachineWashController controller = Get.put(MachineWashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.backgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(57.0),
            child: Appbar(
              title: "Mix Stains",
            )),
        body: Obx(
          () => controller.isLoading.value == true
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Machine Wash",
                          style: ThemeText.subHeading,
                        )),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mix Stains"),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/download.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    controller.machineWash.value.machineWash![0]
                                        .clothType,
                                    style: ThemeText.blueHeading,
                                  )
                                ],
                              ),
                              Container(
                                width: 20.0,
                                height: 15.0,
                                child: Divider(color: ColorApp.blueColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Run Time: ",
                                    style: ThemeText.blackText,
                                  ),
                                  Text(
                                    controller.machineWash.value.machineWash![0]
                                        .runTime,
                                    style: ThemeText.commonHeader,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: [
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Chip(
                                      padding: EdgeInsets.all(8),
                                      backgroundColor: Colors.white,
                                      label: Text(
                                        controller.machineWash.value
                                            .machineWash![0].celcius,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Chip(
                                      padding: EdgeInsets.all(8),
                                      backgroundColor: Colors.white,
                                      label: Text(
                                        controller.machineWash.value
                                                .machineWash![0].rpm +
                                            ' rpm',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Chip(
                                      padding: EdgeInsets.all(8),
                                      backgroundColor: Colors.white,
                                      label: Text(
                                        controller.machineWash.value
                                            .machineWash![0].spin,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Chip(
                                      backgroundColor: Colors.white,
                                      label: Text(
                                        controller.machineWash.value
                                            .machineWash![0].dryness,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        "Please load the garment into the washing machine and press start.",
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Screens.washCycle);
                        },
                        child: Text("START"),
                      ),
                    ),
                  ],
                ),
        ),
        bottomNavigationBar: Row(
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
            Container(
              width: 100.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  "CANCEL",
                  style: TextStyle(color: ColorApp.blackColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
