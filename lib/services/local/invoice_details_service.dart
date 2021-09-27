// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/models/invoice_details_model.dart';
// import 'package:sells_app/repositories/repository.dart';
//
// class InvoiceDetailsService {
//   Repository? _repository;
//
//   InvoiceDetailsService() {
//     _repository = Repository();
//   }
//
//   // Create data
//   saveInvoiceDetails(InvoiceDetailsModel invoiceDetails) async {
//     return await _repository!
//         .insertData('invoiceDetails', invoiceDetails.invoiceDetailsMap());
//   }
//
//   // Read data
//   readInvoiceDetails() async {
//     return await _repository!.readData('invoiceDetails');
//   }
//
//   // Read data by id
//   readInvoiceDetailsById(invoiceDetailsId) async {
//     return await _repository!.readDataById('invoiceDetails', invoiceDetailsId);
//   }
//
//   // Read data by col
//   readInvoiceDscByCol(colName, colVal) async {
//     return await _repository!
//         .readDataByColumnName('invoiceDetails', colName, colVal);
//   }
//
//   // Update data
//   updateInvoiceDetailsQuantity(
//       colName, colVal, colCondition, valCondition) async {
//     return await _repository!.updateDataColByCol(
//         'invoiceDetails', '$colName', colVal, '$colCondition', valCondition);
//   }
//
//   // Delete data
//   deleteInvoiceDetails(invoiceDetailsId) async {
//     return await _repository!.deleteData('invoiceDetails', invoiceDetailsId);
//   }
//
//   // Delete data by Col
//   deleteInvoiceDetailsByCol(colName, colVal) async {
//     return await _repository!
//         .deleteDataByColumn('invoiceDetails', '$colName', colVal);
//   }
//
//   // Delete data by Col2
//   deleteInvoiceDetailsBy2Col(colName, colVal) async {
//     return await _repository!
//         .deleteDataByTwoColumns('invoiceDetails', '$colName', 'invoiceId', colVal, '1');
//   }
// }
