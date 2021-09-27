// // Eng Mouaz M. Al-Shahmeh
// import 'package:sells_app/models/buy_invoice_model.dart';
// import 'package:sells_app/repositories/repository.dart';
//
// class BuyInvoiceService {
//   Repository? _repository;
//
//   BuyInvoiceService() {
//     _repository = Repository();
//   }
//
//   // Create data
//   saveBuyInvoice(BuyInvoiceModel buyInvoice) async {
//     return await _repository!
//         .insertData('buyInvoices', buyInvoice.buyInvoiceMap());
//   }
//
//   // Read data
//   readBuyInvoices() async {
//     return await _repository!.readData('buyInvoices');
//   }
//
//   // Read data by id
//   readbBuyInvoiceById(buyInvoiceId) async {
//     return await _repository!.readDataById('buyInvoices', buyInvoiceId);
//   }
//
//   // Read data by column
//   readbBuyInvoiceByColumn(colName, colVal) async {
//     return await _repository!
//         .readDataByColumnName('buyInvoices', colName, colVal);
//   }
//
//   // Update data
//   updateBuyInvoice(BuyInvoiceModel buyInvoice) async {
//     return await _repository!
//         .updateData('buyInvoices', buyInvoice.buyInvoiceMap());
//   }
//
//   // Delete data
//   deleteBuyInvoice(buyInvoiceId) async {
//     return await _repository!.deleteData('buyInvoices', buyInvoiceId);
//   }
// }
