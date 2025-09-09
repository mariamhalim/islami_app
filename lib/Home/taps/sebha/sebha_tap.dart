import 'package:flutter/material.dart';
import 'package:islami/Home/taps/sebha/sebha_animation.dart';
import 'package:islami/utils/app_styles.dart';

class SebhaTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Column(
      children: [
        Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ', style: AppStyles.bold36Wight),
        Stack(
          children: [Container(width: width * 100, child: TasbeehImage())],
        ),
      ],
    );
  }
}
