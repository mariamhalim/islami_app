import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_pref_helper.dart';

class MostRecentlyProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListAsString =
        prefs.getStringList(SharedPrefKeys.mostRecentKey) ?? [];
    mostRecentList = mostRecentListAsString
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}
