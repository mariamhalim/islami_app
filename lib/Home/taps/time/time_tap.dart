import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/Home/taps/time/time_img.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class TimeTap extends StatelessWidget {
  List<String> pray = [
    'Sunrise\n01:04\nPM',
    'Dhuher\n01:01\nPM',
    'Aser\n04:38\nPM',
    'Maghireb\n07:57\nPM',
    'Ishaa\n09:57\nPM',
  ];

  TimeTap({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return Column(
      children: [

        Container(
          height: height * 0.35,
          width: width * 0.9,
          decoration: BoxDecoration(
            color: AppColors.goldColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '16 Jul\n2024', style: AppStyles.bold16Wight,),
                    ),
                    Expanded(child: Center(
                        child: Text('Tuesday', style: AppStyles.bold20Black,))),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '09 Moh\n1449', style: AppStyles.bold16Wight,),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03,),
                Center(
                  child: CarouselSlider(
                    items: List.generate(pray.length, (i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.blackColor,
                                  AppColors.goldColor
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${pray[i]}',
                                textAlign: TextAlign.center,
                                style: AppStyles.bold20Wight,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: height * 0.12,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 0.4,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('                                 '),
                    ),
                    Expanded(child: Text(
                      'Next Pray - 02:32', style: AppStyles.bold16Black,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.volume_off_rounded),
                    )
                  ],
                ),

              ]
          ),
        ),
        SizedBox(height: height * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Text('Azkar', style: AppStyles.bold16Wight,),
            ),
            SizedBox(height: height * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeImg(image: AppAssets.bell, text: 'Evening Azkar',),
                SizedBox(width: width * 0.02),
                TimeImg(image: AppAssets.bubble, text: 'Morning Azkar',),
              ],
            ),
          ],
        )
      ],
    );
  }
}
