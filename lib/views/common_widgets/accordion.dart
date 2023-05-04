import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/controllers/pre_treatment_controller.dart';
import 'package:newdemoproject/mixins/mixins.dart';
import 'package:newdemoproject/models/sub_stains/sub_stains.dart';
import 'package:newdemoproject/utils/styles.dart';

class Accordion extends StatelessWidget {
  final String title;
  final List<PreTreatmentGuide> content;
  final bool isOpened;
  final int idx;

  Accordion(
      {required this.title,
      required this.content,
      required this.isOpened,
      required this.idx});

  final PreTreatmentController controller = Get.put(PreTreatmentController());
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(children: [
        ListTile(
          leading: Image.asset(
            "assets/images/Beverages.png",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            title,
            style: isOpened ? ThemeText.stainName : ThemeText.blackText,
          ),
          trailing: IconButton(
              icon: Icon(
                isOpened ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: isOpened ? ColorApp.blueColor : ColorApp.blackColor,
              ),
              onPressed: () {
                controller.onClickOpen(idx, isOpened);
              }),
        ),
        isOpened
            ? Container(
                color: ColorApp.backgroundColor,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: content.length,
                  itemBuilder: (context, position) {
                    return Details(
                      item: content[position],
                    );
                  },
                ),
              )
            : Container()
      ]),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.item,
  }) : super(key: key);

  final PreTreatmentGuide item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Step " + item.stepCount!),
        SizedBox(
          height: 6.0,
        ),
        if (item.stepCount == "1") Image.asset("assets/images/step1.png"),
        if (item.stepCount == "2") Image.asset("assets/images/step2.png"),
        if (item.stepCount == "3") Image.asset("assets/images/step3.png"),
        SizedBox(
          height: 6.0,
        ),
        Text(item.stainDescription!),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
