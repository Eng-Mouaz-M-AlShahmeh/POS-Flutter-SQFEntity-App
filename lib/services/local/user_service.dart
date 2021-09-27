// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/models/user_model.dart';
// import 'package:sells_app/repositories/repository.dart';
//
// class UserService {
//   Repository? _repository;
//
//   UserService() {
//     _repository = Repository();
//   }
//
//   // Create data
//   saveUser(UserModel user) async {
//     return await _repository!.insertData('users', user.userMap());
//   }
//
//   // Read data
//   readUsers() async {
//     return await _repository!.readData('users');
//   }
//
//   // Read data by id
//   readUserById(userId) async {
//     return await _repository!.readDataById('users', userId);
//   }
//
//   // Update data
//   updateUser(UserModel user) async {
//     return await _repository!.updateData('users', user.userMap());
//   }
//
//   // Delete data
//   deleteUser(userId) async {
//     return await _repository!.deleteData('users', userId);
//   }
// }
