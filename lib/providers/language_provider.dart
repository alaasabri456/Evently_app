import 'package:evently/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/foundation.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage=PrefsManager.getSavedLanguage()??"en";
  void changeAppLanguage(String newLanguage){
    if( currentLanguage==newLanguage)return;
    currentLanguage=newLanguage;
    PrefsManager.saveLanguage(currentLanguage);
    notifyListeners();
  }
  bool get isEnglish=>currentLanguage=="en";
}