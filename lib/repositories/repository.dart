// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/repositories/database_connection.dart';
// import 'package:sqflite/sqlite_api.dart';
//
// class Repository {
//   DatabaseConnection? _databaseConnection;
//
//   Repository() {
//     // Initialize database connection
//     _databaseConnection = DatabaseConnection();
//   }
//
//   static Database? _database;
//
//   Future<Database?> get database async {
//     if (_database != null) return _database;
//     _database = await _databaseConnection!.setDatabase();
//     return _database;
//   }
//
//   // Inserting data to table
//   insertData(table, data) async {
//     var connection = await database;
//     return await connection!.insert(table, data);
//   }
//
//   // Read data from table
//   readData(table) async {
//     var connection = await database;
//     return await connection!.query(table);
//   }
//
//   // Read data from table by column name
//   readDataByColumnName(table, columnName, columnValue) async {
//     var connection = await database;
//     return await connection!
//         .query(table, where: '$columnName', whereArgs: [columnValue]);
//   }
//
//   // Read data by id from table
//   readDataById(table, itemId) async {
//     var connection = await database;
//     return await connection!.query(table, where: 'id=?', whereArgs: [itemId]);
//   }
//
//   // Read data by id from table
//   readLastRowInserted(table) async {
//     var connection = await database;
//     return await connection!.rawQuery(
//         "SELECT * FROM $table WHERE id=(SELECT max(id) FROM $table )");
//   }
//
//   // Read data from table by 2 columns
//   readDataByTwoColumns(table, column1, column2, val1, val2) async {
//     var connection = await database;
//     return await connection!.rawQuery(
//         'SELECT * FROM $table WHERE $column1 = $val1 AND $column2 = $val2');
//   }
//
//   // Update data from table
//   updateData(table, data) async {
//     var connection = await database;
//     return await connection!
//         .update(table, data, where: 'id=?', whereArgs: [data['id']]);
//   }
//
//   // Update data from table
//   updateDataColByCol(table, col1, val1, colCondition, valCondition) async {
//     var connection = await database;
//     return await connection!.rawUpdate(
//         'UPDATE $table SET $col1 = ? WHERE $colCondition = ? AND invoiceId = ?',
//         ['$val1', '$valCondition', '1']);
//   }
//
//   // Delete data from table
//   deleteData(table, itemId) async {
//     var connection = await database;
//     return await connection!.rawDelete('DELETE FROM $table WHERE id = $itemId');
//   }
//
//   // Delete data from table by 2 columns
//   deleteDataByTwoColumns(table, column1, column2, val1, val2) async {
//     var connection = await database;
//     return await connection!.rawDelete(
//         'DELETE FROM $table WHERE $column1 = $val1 AND $column2 = $val2');
//   }
//
//   // Delete data from table by 1 columns
//   deleteDataByColumn(table, column1, val1) async {
//     var connection = await database;
//     return await connection!
//         .rawDelete('DELETE FROM $table WHERE $column1 = $val1');
//   }
// }
