// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/repositories/orm_config.dart';

class CategoryProvider extends ChangeNotifier {
  static const _dateTimeString = '2020-07-17T03:18:31.177769-04:00';
  DateTime? _dateTime = DateTime.parse(_dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
  DateTime? get dateTime => _dateTime;

  String? _categoryTitle = '';
  String get categoryTitle => _categoryTitle!;
  setCategoryTitle(String? val) {
    _categoryTitle = val;
    notifyListeners();
  }

  String? _description = '';
  String get description => _description!;
  setDescription(String? val) {
    _description = val;
    notifyListeners();
  }

  bool _isMain = false;
  bool get isMain => _isMain;
  setIsMain() {
    _isMain = !_isMain;
    notifyListeners();
  }

  bool _isSub = false;
  bool get isSub => _isSub;
  setIsSub() {
    _isSub = !_isSub;
    notifyListeners();
  }

  int? _underMainId;
  int? get underMainId => _underMainId;
  setUnderMainId(int? val) {
    _underMainId = val;
    notifyListeners();
  }

  List<Category> _categoryList = [];
  List<Category> get categoryList => _categoryList;
  getAllCategories() async {
    _categoryList = await Category().select().toList();
    notifyListeners();
  }

  addCategory() async {
    await Category(
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      categoryTitle: _categoryTitle,
      description: _description,
      isMain: _isMain == true ? 1 : 0,
      isSub: _isSub == true ? 1 : 0,
      underMainId: _underMainId,
    ).save();
    getAllCategories();
    notifyListeners();
  }

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;
  getSelectedCat(categoryId) async {
    _selectedCategory = await Category().getById(categoryId);
    notifyListeners();
  }

  updateCategory() async {
    await Category(
      id: _selectedCategory!.id,
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      categoryTitle: _categoryTitle,
      description: _description,
      isMain: _isMain == true ? 1 : 0,
      isSub: _isSub == true ? 1 : 0,
      underMainId: _underMainId,
    ).save();
    getAllCategories();
    notifyListeners();
  }

  deleteCategory(index) async {
    await Category().select().id.equals(_categoryList[index].id).delete();
    getAllCategories();
    notifyListeners();
  }

}
