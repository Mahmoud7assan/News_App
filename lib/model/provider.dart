import 'package:flutter/material.dart';

class AppConfig extends ChangeNotifier {
  String query = '';
  bool isSearch = false;
  String language = 'ar';


  void ChangeLanguage(String newLanguage) {
    if(language == newLanguage){
      return;
    }
    language = newLanguage;
    notifyListeners();
  }

  void isSearchEnable() {
    isSearch = !isSearch;
    notifyListeners();
  }

  void KeyWordSeach(String newValue) {
    query = newValue;
    notifyListeners();
  }
}
