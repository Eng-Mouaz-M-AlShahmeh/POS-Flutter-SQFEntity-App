// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/models/unit_model.dart';
// import 'package:sells_app/repositories/repository.dart';
//
// class UnitService {
//   Repository? _repository;
//
//   UnitService() {
//     _repository = Repository();
//   }
//
//   // Create data
//   saveUnit(UnitModel unit) async {
//     return await _repository!.insertData('units', unit.unitMap());
//   }
//
//   // Read data
//   readUnits() async {
//     return await _repository!.readData('units');
//   }
//
//   // Read data by id
//   readUnitById(unitId) async {
//     return await _repository!.readDataById('units', unitId);
//   }
//
//   // Update data
//   updateUnit(UnitModel unit) async {
//     return await _repository!.updateData('units', unit.unitMap());
//   }
//
//   // Delete data
//   deleteUnit(unitId) async {
//     return await _repository!.deleteData('units', unitId);
//   }
// }
