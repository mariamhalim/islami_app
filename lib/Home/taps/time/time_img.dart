import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../utils/app_colors.dart';

class TimeImg extends StatelessWidget {
  final String image;
  final String text;

  const TimeImg({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      width: width * 0.43,
      height: height * 0.25,
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.goldColor, width: 2),
      ),
      child: Column(
        children: [
          Image.asset(image),
          Text(text, style: AppStyles.bold20Wight),
        ],
      ),
    );
  }
}
