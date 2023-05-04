import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.buttonName,
    required this.path,
    required this.textColor,
  }) : super(key: key);
  final Color buttonColor, textColor;
  final String buttonName;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        onPressed: () {
          if (path == "") {
            Get.back();
          } else {
            Get.toNamed(path);
          }
        },
        child: Text(
          buttonName,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
