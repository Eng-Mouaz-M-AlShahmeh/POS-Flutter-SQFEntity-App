// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/models/category_model.dart';
// import 'package:sells_app/repositories/repository.dart';
//
// class CategoryService {
//   Repository? _repository;
//
//   CategoryService() {
//     _repository = Repository();
//   }
//
//   // Create data
//   saveCategory(CategoryModel category) async {
//     return await _repository!.insertData('categories', category.categoryMap());
//   }
//
//   // Read data
//   readCategories() async {
//     return await _repository!.readData('categories');
//   }
//
//   // Read data by id
//   readCategoryById(categoryId) async {
//     return await _repository!.readDataById('categories', categoryId);
//   }
//
//   // Update data
//   updateCategory(CategoryModel category) async {
//     return await _repository!.updateData('categories', category.categoryMap());
//   }
//
//   // Delete data
//   deleteCategory(categoryId) async {
//     return await _repository!.deleteData('categories', categoryId);
//   }
// }
