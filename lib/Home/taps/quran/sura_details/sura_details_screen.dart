import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/taps/quran/sura_details/sura_content_view.dart';
import 'package:islami/providers/most_recently_provider.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../Widgets/quran_recourses.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});


  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  late MostRecentlyProvider mostRecentlyProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentlyProvider.readMostRecentList();
  }

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
    int index = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    mostRecentlyProvider = Provider.of<MostRecentlyProvider>(context);
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.goldColor),
        backgroundColor: AppColors.blackColor,
        title: Text(
          QuranResourses().quranSurahsEnglish[index],
          style: AppStyles.bold20Gold,
        ),
      ),
      backgroundColor: AppColors.blackColor,
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          image: DecorationImage(image: AssetImage(AppAssets.suraDetails)),
        ),

        child: Padding(
          padding: EdgeInsets.all(8
          ),
          child: Column(
            children: [
              Text('${QuranResourses().quranSurahs[index]}',
                style: AppStyles.bold24Gold,),
              SizedBox(height: height * 0.08,)
              , Expanded(
                child: verses.isEmpty ?
                Center(child: CircularProgressIndicator(
                  color: AppColors.goldColor,)) :
                ListView.separated(itemBuilder: (context, index) {
                  return SuraContent(content: verses[index], index: index,);
                },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: height * 0.01,
                      );
                    },
                    itemCount: verses.length),
              ),
              SizedBox(height: height * 0.1)
            ],
          ),
        ),
      ),

    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
        'assets/files/Suras/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);
    }
    verses = suraLines;
    setState(() {

    });
  }
}
