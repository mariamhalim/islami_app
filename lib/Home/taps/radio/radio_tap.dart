import 'package:flutter/material.dart';
import 'package:islami/Home/taps/radio/floating_radio_button.dart';
import 'package:islami/Home/taps/radio/shiokh.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class RadioTap extends StatelessWidget {
  final int index;

  const RadioTap({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioButton(
              text: 'Radio',
              color: AppColors.goldColor,
              style: AppStyles.RegBlack16,
            ),
            RadioButton(
              text: 'Reciters',
              color: AppColors.trancColor,
              style: AppStyles.RegGold16,
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Container(
                  height: height * 0.16,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Center(
                          child: Text(
                            'Radio ${Shiokh().reciters[index]}',
                            style: AppStyles.bold20Black,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Image.asset(AppAssets.masged)],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.play_arrow_rounded, size: 44),
                            Icon(Icons.volume_up_sharp, size: 44),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
              itemCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
