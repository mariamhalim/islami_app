import 'package:flutter/material.dart';
import 'package:islami/Home/taps/quran/Widgets/quran_recourses.dart';
import 'package:islami/providers/most_recently_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class MostResently extends StatefulWidget {
  MostResently({super.key});

  @override
  State<MostResently> createState() => _MostResentlyState();
}

class _MostResentlyState extends State<MostResently> {
  late MostRecentlyProvider mostRecentlyProvider;
  List<int> mostRecentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentlyProvider.readMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var mostRecentProvider = Provider.of<MostRecentlyProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.01),
          Text('Most Recently', style: AppStyles.bold16Wight),
          SizedBox(
            height: height * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              QuranResourses()
                                  .quranSurahsEnglish[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              QuranResourses().quranSurahs[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              '${QuranResourses().surahAyahCount[mostRecentProvider.mostRecentList[index]]}',
                              style: AppStyles.bold16Black,
                            ),
                          ],
                        ),
                      ),
                      Image(image: AssetImage(AppAssets.most)),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.02),
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
          SizedBox(height: height * 0.03),
        ],
      ),
    );
  }
}
