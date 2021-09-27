// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int _bottomNavBarIndex = 0;
  int _invoiceNavIndex = 0;

  int get bottomNavBarIndex => _bottomNavBarIndex;
  int get invoiceNavIndex => _invoiceNavIndex;

  void setBottomNavBarIndex(int val) {
    _bottomNavBarIndex = val;
    notifyListeners();
  }

  void setInvoiceNavIndex(int val) {
    _invoiceNavIndex = val;
    notifyListeners();
  }
}
