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

}
