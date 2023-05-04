import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/utils/styles.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
              color: Colors.black,
              onPressed: () {
                Get.back();
              },
            ),
            Text(
              title,
              style: ThemeText.commonHeader,
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            size: 20,
          ),
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}
