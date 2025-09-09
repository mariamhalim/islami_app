import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../utils/app_styles.dart';

class TasbeehImage extends StatefulWidget {
  @override
  TasbeehImageState createState() => TasbeehImageState();
}

class TasbeehImageState extends State<TasbeehImage> {
  bool rotate = false;
  int counter = 0;

  final List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  void onTasbeehTap() {
    setState(() {
      rotate = !rotate;

      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int zikrIndex = ((counter ~/ 33) % azkar.length);

    return Stack(
      children: [
        InkWell(
          onTap: onTasbeehTap,
          borderRadius: BorderRadius.circular(200),
          child: Center(
            child: Image.asset('assets/images/Sebha (1).png')
                .animate(target: rotate ? 1 : 0)
                .rotate(duration: 800.ms, curve: Curves.easeInOut),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.22),
          child: Container(
            width: width * 100,
            child: Column(
              children: [
                Text(azkar[zikrIndex], style: AppStyles.bold36Wight),
                SizedBox(height: height * 0.03),
                Text('$counter', style: AppStyles.bold36Wight),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
