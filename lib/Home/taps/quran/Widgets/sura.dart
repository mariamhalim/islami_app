import 'package:flutter/material.dart';
import 'package:islami/Home/taps/quran/Widgets/quran_recourses.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SuraList extends StatelessWidget {
  final int index;

  SuraList({required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.countSura),
            Text('${index + 1}', style: AppStyles.bold14Wight),
          ],
        ),
        SizedBox(width: width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${QuranResourses().quranSurahsEnglish[index]}',
              style: AppStyles.bold20Wight,
            ),
            Text(
              '${QuranResourses().surahAyahCount[index]}',
              style: AppStyles.bold14Wight,
            ),
          ],
        ),
        Spacer(),
        Text(
          '${QuranResourses().quranSurahs[index]}',
          style: AppStyles.bold20Wight,
        ),
        SizedBox(height: height * 0.07),
      ],
    );
  }
}
