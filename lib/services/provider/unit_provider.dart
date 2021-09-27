// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/repositories/orm_config.dart';

class UnitProvider extends ChangeNotifier {
  static const _dateTimeString = '2020-07-17T03:18:31.177769-04:00';
  DateTime? _dateTime = DateTime.parse(_dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
  DateTime? get dateTime => _dateTime;

  String _unitTitle = '';
  String get unitTitle => _unitTitle;
  setUnitTitle(String val) {
    _unitTitle = val;
    notifyListeners();
  }

  String _size = '0';
  String get size => _size;
  setSize(String val) {
    _size = val;
    notifyListeners();
  }

  bool _needBalance = false;
  bool get needBalance => _needBalance;
  setNeedBalance() {
    _needBalance = !_needBalance;
    notifyListeners();
  }

  List<Unit> _unitsList = [];
  List<Unit> get unitsList => _unitsList;
  getAllUnits() async {
    _unitsList = await Unit().select().toList();
    notifyListeners();
  }

  addUnit() async {
    await Unit(
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      unitTitle: _unitTitle,
      size: _size,
      needBalance: _needBalance.toString(),
    ).save();
    getAllUnits();
    notifyListeners();
  }

  Unit? _selectedUnit;
  Unit? get selectedUnit => _selectedUnit;
  getSelectedUnit(unitId) async {
    _selectedUnit = await Unit().getById(unitId);
    notifyListeners();
  }

  updateUnit() async {
    await Unit(
      id: _selectedUnit!.id,
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      unitTitle: _unitTitle,
      size: _size,
      needBalance: _needBalance.toString(),
    ).save();
    getAllUnits();
    notifyListeners();
  }

  deleteUnit(index) async {
    await Unit().select().id.equals(_unitsList[index].id).delete();
    getAllUnits();
    notifyListeners();
  }

}
