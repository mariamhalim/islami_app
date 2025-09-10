import 'package:flutter/material.dart';
import 'package:islami/Home/taps/quran/Widgets/most_recently.dart';
import 'package:islami/Home/taps/quran/Widgets/quran_recourses.dart';
import 'package:islami/Home/taps/quran/Widgets/sura.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/shared_pref_helper.dart';

class QuranTap extends StatefulWidget {


  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int> filterList = List.generate(114, (index) => index,);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyles.bold16Wight,
            cursorColor: AppColors.goldColor,
            onChanged: (newText) {
              searchByNewText(newText);
            },
            decoration: InputDecoration(
              prefixIcon: Image.asset(AppAssets.quraanIcon2),
              focusedBorder: buildTextFileBorder(),
              enabledBorder: buildTextFileBorder(),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16Wight,
            ),
          ),
          SizedBox(height: height * 0.03),
          MostResently(),
          Text('Suras List', style: AppStyles.bold16Wight),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveLastSuraIndex(filterList[index]);
                    Navigator.of(context).pushNamed(
                        AppRoutes.SuraDetailsScreen,
                        arguments: filterList[index]);
                  },
                  child: SuraList(index: filterList[index],),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: width * 0.10,
                  indent: width * 0.10,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildTextFileBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.goldColor, width: 2),
      borderRadius: BorderRadius.circular(16),
    );
  }

  void searchByNewText(String newText) {
    List<int> searchResultList = [];
    for (int i = 0; i < QuranResourses().quranSurahsEnglish.length; i++) {
      if (QuranResourses().quranSurahsEnglish[i].toLowerCase().contains(
          newText.toLowerCase())) {
        searchResultList.add(i);
      }
      if (QuranResourses().quranSurahs[i].contains(newText)) {
        searchResultList.add(i);
      }
    }
    filterList = searchResultList;
    setState(() {

    });
  }
}