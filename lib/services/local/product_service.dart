// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/models/product_model.dart';
// import 'package:sells_app/repositories/repository.dart';
//
// class ProductService {
//   Repository? _repository;
//
//   ProductService() {
//     _repository = Repository();
//   }
//
//   // Create data
//   saveProduct(ProductModel product) async {
//     return await _repository!.insertData('products', product.productMap());
//   }
//
//   // Read data
//   readProducts() async {
//     return await _repository!.readData('products');
//   }
//
//   // Read data by id
//   readProductById(productId) async {
//     return await _repository!.readDataById('products', productId);
//   }
//
//   // Read last data by id
//   readLastRowInserted() async {
//     return await _repository!.readLastRowInserted('products');
//   }
//
//   // Update data
//   updateProduct(ProductModel product) async {
//     return await _repository!.updateData('products', product.productMap());
//   }
//
//   // Delete data
//   deleteProduct(productId) async {
//     return await _repository!.deleteData('products', productId);
//   }
// }
