// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/repositories/orm_config.dart';

class UserProvider extends ChangeNotifier {
  static const _dateTimeString = '2020-07-17T03:18:31.177769-04:00';
  DateTime? _dateTime = DateTime.parse(_dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
  DateTime? get dateTime => _dateTime;

  String _username = '';
  String get username => _username;
  setUsername(String? val) {
    _username = val!;
    notifyListeners();
  }

  String _mobile = '';
  String get mobile => _mobile;
  setMobile(String? val) {
    _mobile = val!;
    notifyListeners();
  }

  String _nationalAddress = '';
  String get nationalAddress => _nationalAddress;
  setNationalAddress(String? val) {
    _nationalAddress = val!;
    notifyListeners();
  }

  String _nationalID = '';
  String get nationalID => _nationalID;
  setNationalID(String? val) {
    _nationalID = val!;
    notifyListeners();
  }

  String _maxDebtLimit = '';
  String get maxDebtLimit => _maxDebtLimit;
  setMaxDebtLimit(String? val) {
    _maxDebtLimit = val!;
    notifyListeners();
  }

  String _numTermBills = '1';
  String get numTermBills => _numTermBills;
  setNumTermBills(String? val) {
    _numTermBills = val!;
    notifyListeners();
  }

  String _prevTermBalance = '0.0';
  String get prevTermBalance => _prevTermBalance;
  setPrevTermBalance(String? val) {
    _prevTermBalance = val!;
    notifyListeners();
  }

  int _debtorOrCreditorValue = 1;
  int get debtorOrCreditor => _debtorOrCreditorValue;
  setDebtorOrCreditorValue(int? val) {
    _debtorOrCreditorValue = val!;
    notifyListeners();
  }

  List<User> _userList = [];
  List<User> get userList => _userList;
  getAllUsers() async {
    _userList = await User().select().toList();
    notifyListeners();
  }

  addUser() async {
    await User(
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      username: _username,
      mobile: _mobile,
      nationalAddress: _nationalAddress,
      nationalID: _nationalID,
      maxDebtLimit: _maxDebtLimit,
      numTermBills: _numTermBills,
      prevTermBalance: _prevTermBalance,
      debtorOrCreditor: _debtorOrCreditorValue,
    ).save();
    getAllUsers();
    notifyListeners();
  }

  User? _selectedUser;
  User? get selectedUser => _selectedUser;
  getSelectedUser(userId) async {
    _selectedUser = await User().getById(userId);
    notifyListeners();
  }

  updateUser() async {
    await User(
      id: _selectedUser!.id,
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      username: _username,
      mobile: _mobile,
      nationalAddress: _nationalAddress,
      nationalID: _nationalID,
      maxDebtLimit: _maxDebtLimit,
      numTermBills: _numTermBills,
      prevTermBalance: _prevTermBalance,
      debtorOrCreditor: _debtorOrCreditorValue,
    ).save();
    getAllUsers();
    notifyListeners();
  }

  deleteUser(index) async {
    await User().select().id.equals(_userList[index].id).delete();
    getAllUsers();
    notifyListeners();
  }

}
