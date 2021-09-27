// // Eng Mouaz M. Al-Shahmeh
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
//
// class DatabaseConnection {
//   setDatabase() async {
//     var directory = await getApplicationDocumentsDirectory();
//     var path = join(directory.path, 'db_pos_app');
//     var database =
//         await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
//     return database;
//   }
//
//   _onCreatingDatabase(Database database, int version) async {
//     await database.execute('''
//         CREATE TABLE users(
//           id INTEGER PRIMARY KEY,
//           isActive INTEGER,
//           isCanceled INTEGER,
//           createdBy TEXT,
//           createdDate TEXT,
//           lastModifiedDate TEXT,
//           modifyBy TEXT,
//           createdDateInLocal TEXT,
//           username TEXT,
//           mobile TEXT,
//           nationalAddress TEXT,
//           nationalID TEXT,
//           maxDebtLimit TEXT,
//           numTermBills TEXT,
//           prevTermBalance TEXT,
//           debtorOrCreditor INTEGER,
//           knownAs TEXT,
//           photoUrl TEXT)
//         ''');
//
//     await database.execute('''
//         CREATE TABLE products(
//           id INTEGER PRIMARY KEY,
//           isActive INTEGER,
//           isCanceled INTEGER,
//           createdBy TEXT,
//           createdDate TEXT,
//           lastModifiedDate TEXT,
//           modifyBy TEXT,
//           createdDateInLocal TEXT,
//           productName TEXT,
//           productNum INTEGER,
//           serialNumber TEXT,
//           description TEXT,
//           imageUrl TEXT,
//           catId TEXT,
//           vat REAL,
//           canBuy INTEGER,
//           canSale INTEGER
//           )
//         ''');
//
//     await database.execute('''
//         CREATE TABLE categories(
//           id INTEGER PRIMARY KEY,
//           isActive INTEGER,
//           isCanceled INTEGER,
//           createdBy TEXT,
//           createdDate TEXT,
//           lastModifiedDate TEXT,
//           modifyBy TEXT,
//           createdDateInLocal TEXT,
//           categoryTitle TEXT,
//           description TEXT,
//           underMainId INTEGER,
//           isMain INTEGER,
//           isSub INTEGER)
//         ''');
//
//     await database.execute('''
//         CREATE TABLE unitsProduct(
//           id INTEGER PRIMARY KEY,
//           isActive INTEGER,
//           isCanceled INTEGER,
//           createdBy TEXT,
//           createdDate TEXT,
//           lastModifiedDate TEXT,
//           modifyBy TEXT,
//           createdDateInLocal TEXT,
//           sellPrice TEXT,
//           buyPrice TEXT,
//           barcode TEXT,
//           quantity TEXT,
//           description TEXT,
//           productId INTEGER,
//           unitId INTEGER)
//         ''');
//
//     await database.execute('''
//         CREATE TABLE units(
//           id INTEGER PRIMARY KEY,
//           isActive INTEGER,
//           isCanceled INTEGER,
//           createdBy TEXT,
//           createdDate TEXT,
//           lastModifiedDate TEXT,
//           modifyBy TEXT,
//           createdDateInLocal TEXT,
//           unitTitle TEXT,
//           size TEXT,
//           needBalance TEXT)
//         ''');
//
//     await database.execute('''
//         CREATE TABLE buyInvoices(
//           id INTEGER PRIMARY KEY,
//           isActive INTEGER,
//           isCanceled INTEGER,
//           createdBy TEXT,
//           createdDate TEXT,
//           lastModifiedDate TEXT,
//           modifyBy TEXT,
//           createdDateInLocal TEXT,
//           discountType INTEGER,
//           vatPercent INTEGER,
//           countItem INTEGER,
//           clientId TEXT,
//           clientName TEXT,
//           totalNetBill TEXT,
//           totalBeforeDiscount TEXT,
//           discountAmount TEXT,
//           totalAfterDiscount TEXT,
//           vatAmount TEXT,
//           totalAfterVAT TEXT,
//           totalBillFinal TEXT,
//           payedAmount TEXT,
//           remainingAmount TEXT,
//           notPayedAmount TEXT)
//         ''');
//
//     await database.execute('''
//         CREATE TABLE invoiceDetails(
//           id INTEGER PRIMARY KEY,
//           isActive INTEGER,
//           isCanceled INTEGER,
//           createdBy TEXT,
//           createdDate TEXT,
//           lastModifiedDate TEXT,
//           modifyBy TEXT,
//           createdDateInLocal TEXT,
//           invoiceId TEXT,
//           unitProductId TEXT,
//           quantity TEXT)
//         ''');
//   }
// }
