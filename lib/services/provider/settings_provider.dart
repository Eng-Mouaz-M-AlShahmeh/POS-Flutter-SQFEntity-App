// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  final List<Map> _paperSizesList = [
    {'id': '1', 'name': 'A4'},
    {'id': '2', 'name': 'cm 8'},
    {'id': '3', 'name': 'cm 5.5'},
  ];

  List<Map> get paperSizesList => _paperSizesList;
  int? _paperSizesId = 2;
  int? get paperSizesId => _paperSizesId;
  setPaperSizesId(int val) {
    _paperSizesId = val;
    notifyListeners();
  }

  List<Locale> _allLocales = [Locale('ar', 'SA'), Locale('en', 'US')];
  List<Locale> get allLocales => _allLocales;

  int? _langId = 1;
  int? get langId => _langId;
  setLangId(int val) {
    _langId = val;
    if (val == 1) {
      setLocale(Locale('ar', 'SA'));
    } else if (val == 2) {
      setLocale(Locale('en', 'US'));
    }

    notifyListeners();
  }

  Locale? _locale = Locale('ar', 'SA');
  Locale? get locale => _locale;
  void setLocale(Locale locale) {
    if (!allLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
