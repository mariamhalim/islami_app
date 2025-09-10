import 'package:flutter/material.dart';
import 'package:islami/Home/taps/hadeth/hadeth_tap.dart';
import 'package:islami/Home/taps/quran/Widgets/quran_tap.dart';
import 'package:islami/Home/taps/radio/radio_tap.dart';
import 'package:islami/Home/taps/sebha/sebha_tap.dart';
import 'package:islami/Home/taps/time/time_tap.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> BackGroundImages = [
    AppAssets.bgImage,
    AppAssets.hadethbg,
    AppAssets.sebhabg,
    AppAssets.radiobg,
    AppAssets.timebg,
  ];
  List<Widget> taps = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(index: 0),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(BackGroundImages[selectedIndex]),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.goldColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
              print(selectedIndex);
            },
            items: [
              BottomNavigationBarItem(
                icon: builtBottomNavTap(
                  index: 0,
                  iconName: AppAssets.quraanIcon,
                ),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavTap(
                  index: 1,
                  iconName: AppAssets.hadethIcon,
                ),
                label: 'Hadeth',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavTap(
                  index: 2,
                  iconName: AppAssets.sebhaIcon,
                ),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavTap(
                  index: 3,
                  iconName: AppAssets.radioIcon,
                ),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavTap(index: 4, iconName: AppAssets.timeIcon),
                label: 'Time',
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset(
                  AppAssets.inLogo,
                  height: height * 0.16,
                  width: width * 0.69,
                ),
              ),
              Expanded(child: taps[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget builtBottomNavTap({required int index, required String iconName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadiusGeometry.circular(66),
            ),
            child: ImageIcon(AssetImage(iconName)),
          )
        : ImageIcon(AssetImage(iconName));
  }
}
