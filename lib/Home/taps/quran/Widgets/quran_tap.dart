import 'package:flutter/material.dart';
import 'package:islami/Home/taps/quran/Widgets/sura.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';

class QuranTap extends StatelessWidget {
  final int index;

  const QuranTap({super.key, required this.index});

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
            cursorColor: AppColors.goldColor,
            decoration: InputDecoration(
              prefixIcon: Image.asset(AppAssets.quraanIcon2),
              focusedBorder: buildTextFileBorder(),
              enabledBorder: buildTextFileBorder(),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16Wight,
            ),
          ),
          SizedBox(height: height * 0.03),

          Text('Most Recently', style: AppStyles.bold16Wight),
          SizedBox(height: height * 0.01),
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
                            Text('Al-Anbiya', style: AppStyles.bold24Black),
                            SizedBox(height: height * 0.01),
                            Text('الانبياء', style: AppStyles.bold24Black),
                            SizedBox(height: height * 0.01),
                            Text('112 Verses', style: AppStyles.bold16Black),
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
              itemCount: 10,
            ),
          ),
          SizedBox(height: height * 0.03),
          Text('Suras List', style: AppStyles.bold16Wight),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.SuraDetailsScreen, arguments: index);
                  },
                  child: SuraList(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(endIndent: width * 0.10, indent: width * 0.10);
              },
              itemCount: 114,
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
}
