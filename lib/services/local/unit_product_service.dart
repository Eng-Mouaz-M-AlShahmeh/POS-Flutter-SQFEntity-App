// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/models/unit_product_model.dart';
// import 'package:sells_app/repositories/repository.dart';
// class UnitProductService {
//   Repository? _repository;
//   UnitProductService() {
//     _repository = Repository();
//   }
//   // Create data
//   saveUnitProduct(UnitProductModel unitProduct) async {
//     return await _repository!
//         .insertData('unitsProduct', unitProduct.unitProductMap());
//   }
//   // Read data
//   readUnitsProduct() async {
//     return await _repository!.readData('unitsProduct');
//   }
//   // Read data by id
//   readUnitProductById(unitProductId) async {
//     return await _repository!.readDataById('unitsProduct', unitProductId);
//   }
//   // Read data by column
//   readUnitProductByColumn(productId) async {
//     return await _repository!
//         .readDataByColumnName('unitsProduct', 'productId', productId);
//   }
//   // Read data by 2 column
//   readUnitProductByTwoColumn(productId, unitId) async {
//     return await _repository!.readDataByTwoColumns(
//         'unitsProduct', 'productId', 'unitId', productId, unitId);
//   }
//   // Update data
//   updateUnitProduct(UnitProductModel unitProduct) async {
//     return await _repository!
//         .updateData('unitsProduct', unitProduct.unitProductMap());
//   }
//   // Delete data
//   deleteUnitProduct(unitID, productID) async {
//     return await _repository!.deleteDataByTwoColumns(
//         'unitsProduct', 'unitId', 'productId', unitID, productID);
//   }
//   // Delete data by product id
//   deleteUnitsProductById(productID) async {
//     return await _repository!
//         .deleteDataByColumn('unitsProduct', 'productId', productID);
//   }
//   // Delete data by unit product id
//   deleteUnitProductItem(unitProductId) async {
//     return await _repository!.deleteData('unitsProduct', unitProductId);
//   }
// }
