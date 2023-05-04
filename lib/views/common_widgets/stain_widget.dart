import 'package:flutter/material.dart';
import 'package:newdemoproject/utils/styles.dart';

class StainWidget extends StatelessWidget {
  StainWidget({
    Key? key,
    required this.stainName,
    required this.imageName,
    required this.imageHeight,
    required this.imageWidth,
    required this.isSelected,
  }) : super(key: key);

  final String stainName;
  final String imageName;
  final double imageWidth;
  final double imageHeight;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: new BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white,
            width: 2,
          ),
          borderRadius: new BorderRadius.circular(8.0),
          color: Colors.white),
      margin: const EdgeInsets.all(14.0),
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$imageName',
            width: imageWidth,
            height: imageHeight,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              stainName,
              style: ThemeText.stainName,
            ),
          ),
        ],
      ),
    );
  }
}
