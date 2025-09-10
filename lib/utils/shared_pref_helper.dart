import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKeys {
  static const String mostRecentKey = 'most_recent';
}

void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> mostRecentList =
      prefs.getStringList(SharedPrefKeys.mostRecentKey) ?? [];

  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    mostRecentList.insert(0, '$newSuraIndex');
  }
  if (mostRecentList.length > 5) {
    mostRecentList = mostRecentList.sublist(0, 5);
  }

  await prefs.setStringList(SharedPrefKeys.mostRecentKey, mostRecentList);
}

Future<List<int>> readMostRecentList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentListAsString =
      prefs.getStringList(SharedPrefKeys.mostRecentKey) ?? [];
  List<int> mostRecentListAsInt = mostRecentListAsString
      .map((element) => int.parse(element))
      .toList();
  return mostRecentListAsInt;
}
