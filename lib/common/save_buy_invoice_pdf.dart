// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sells_app/services/provider/buy_invoice_provider.dart';
// import 'package:sells_app/services/provider/product_provider.dart';
// import 'package:sells_app/services/provider/unit_product_provider.dart';
// import 'dart:io';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:provider/provider.dart';
// Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
//   final path = (await getApplicationDocumentsDirectory()).path;
//   final file = File('$path/$fileName');
//   await file.writeAsBytes(bytes, flush: true);
//   OpenFile.open('$path/$fileName');
// }
// Future<void> createPDF(BuildContext context) async {
//   String timestamp = DateTime.now().toString();
//   PdfDocument document = PdfDocument();
//   final page = document.pages.add();
//   // header
//   page.graphics.drawString('Alraedah Co',
//       PdfStandardFont(PdfFontFamily.helvetica, 25),
//       bounds: const Rect.fromLTWH(0, 0, 0, 0)
//   );
//   page.graphics.drawString('Riyadh - KSA',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(0, 40, 0, 0)
//   );
//   page.graphics.drawString('Mobile: +966545433006',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(0, 60, 0, 0)
//   );
//   page.graphics.drawString('Email: info@alraedah.com',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(0, 80, 0, 0)
//   );
//   page.graphics.drawString('C.R. xxxxxxxxxx',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(320, 0, 0, 0)
//   );
//   page.graphics.drawString('Tax card: xxxxxxxxxx',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(320, 20, 0, 0)
//   );
//   page.graphics.drawImage(
//       PdfBitmap(await readImageData('logo.png')),
//       Rect.fromLTWH(190, 0, 110, 110));
//   // end header
//   page.graphics.drawLine(PdfPen.fromBrush(PdfBrushes.gray), Offset(0, 120), Offset(510, 120));
//   page.graphics.drawLine(PdfPen.fromBrush(PdfBrushes.gray), Offset(0, 740), Offset(510, 740));
//   // footer
//   page.graphics.drawString('https://www.alraedah.co',
//   PdfStandardFont(PdfFontFamily.courier, 10),
//   bounds: const Rect.fromLTWH(0, 750, 0, 0)
//   );
//   page.graphics.drawString('$timestamp',
//   PdfStandardFont(PdfFontFamily.courier, 10),
//   bounds: const Rect.fromLTWH(320, 750, 0, 0)
//   );
//   // end footer
//   PdfGrid grid = PdfGrid();
//   grid.style.borderOverlapStyle = PdfBorderOverlapStyle.inside;
//   grid.style = PdfGridStyle(
//       font: PdfStandardFont(PdfFontFamily.helvetica, 14),
//       cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
//   grid.columns.add(count: 5);
//   grid.headers.add(1);
//   PdfGridRowStyle headerStyle = PdfGridRowStyle(
//     backgroundBrush: PdfBrushes.darkGray,
//     textPen: PdfPens.white,
//     textBrush: PdfBrushes.lightYellow,
//     font: PdfStandardFont(PdfFontFamily.timesRoman, 12));
//   grid.headers.applyStyle(headerStyle);
//   PdfGridRow header = grid.headers[0];
//   header.cells[0].value = '#';
//   header.cells[1].value = 'اسم المنتج';
//   header.cells[2].value = 'Unit Buy Price';
//   header.cells[3].value = 'Quantity';
//   header.cells[4].value = 'Buy Price';
//   var buyInvoice = context.read<BuyInvoiceProvider>();
//   var unitsProduct = context.read<UnitProductProvider>();
//   var product = context.read<ProductProvider>();
//   PdfGridRow row;
//   for(var i = 0; i < unitsProduct.invoiceDscList.length; i++) {
//     row = grid.rows.add();
//     row.cells[0].value = '${i+1}';
//     row.cells[1].value = '${product.productList[unitsProduct.unitsProductList[unitsProduct.invoiceDscList[i].unitProductId! - 1].productId! - 1].productName}';
//     row.cells[2].value = '${(double.tryParse(unitsProduct.unitsProductList[unitsProduct.invoiceDscList[i].unitProductId! - 1].buyPrice!))!.toStringAsFixed(2)} SAR';
//     row.cells[3].value = '${unitsProduct.invoiceDscList[i].quantity}';
//     row.cells[4].value = '${(double.tryParse("${unitsProduct.invoiceDscList[i].quantity!}")! * num.tryParse("${unitsProduct.unitsProductList[unitsProduct.invoiceDscList[i].unitProductId! - 1].buyPrice}")!).toStringAsFixed(2)} SAR'; 
//   } 
//   grid.draw(
//       page: page, bounds: const Rect.fromLTWH(0, 150, 0, 0));
//   final page2 = document.pages.add();
//   page2.graphics.drawString('Total Before Discount: ${buyInvoice.totalBeforeDiscount.toStringAsFixed(2)}',
//       PdfStandardFont(PdfFontFamily.helvetica, 20),
//       bounds: const Rect.fromLTWH(0, 130, 0, 0)
//       );
//   page2.graphics.drawString('Discount Amount: ${buyInvoice.discountFixedAmmount.toStringAsFixed(2)}',
//   PdfStandardFont(PdfFontFamily.helvetica, 20),
//   bounds: const Rect.fromLTWH(0, 170, 0, 0)
//   );
//   page2.graphics.drawString('Total After Discount: ${buyInvoice.totalAfterDiscount.toStringAsFixed(2)}',
//   PdfStandardFont(PdfFontFamily.helvetica, 20),
//   bounds: const Rect.fromLTWH(250, 170, 0, 0)
//   );
//   page2.graphics.drawString('VAT Amount: ${buyInvoice.vat.toStringAsFixed(2)} %',
//   PdfStandardFont(PdfFontFamily.helvetica, 20),
//   bounds: const Rect.fromLTWH(0, 210, 0, 0)
//   );
//   page2.graphics.drawString('Final Total: ${buyInvoice.totalAfterVAT.toStringAsFixed(2)} SAR',
//   PdfStandardFont(PdfFontFamily.helvetica, 30),
//   bounds: const Rect.fromLTWH(0, 250, 0, 0)
//   );
//   // header
//   page2.graphics.drawString('Alraedah Co',
//       PdfStandardFont(PdfFontFamily.helvetica, 25),
//       bounds: const Rect.fromLTWH(0, 0, 0, 0)
//   );
//   page2.graphics.drawString('Riyadh - KSA',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(0, 40, 0, 0)
//   );
//   page2.graphics.drawString('Mobile: +966545433006',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(0, 60, 0, 0)
//   );
//   page2.graphics.drawString('Email: info@alraedah.com',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(0, 80, 0, 0)
//   );
//   page2.graphics.drawString('C.R. xxxxxxxxxx',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(320, 0, 0, 0)
//   );
//   page2.graphics.drawString('Tax card: xxxxxxxxxx',
//       PdfStandardFont(PdfFontFamily.helvetica, 15),
//       bounds: const Rect.fromLTWH(320, 20, 0, 0)
//   );
//   page2.graphics.drawImage(
//       PdfBitmap(await readImageData('logo.png')),
//       Rect.fromLTWH(190, 0, 110, 110));
//   //end header
//   page2.graphics.drawLine(PdfPen.fromBrush(PdfBrushes.gray), Offset(0, 120), Offset(510, 120));
//   page2.graphics.drawLine(PdfPen.fromBrush(PdfBrushes.gray), Offset(0, 740), Offset(510, 740));
//   // footer
//   page2.graphics.drawString('https://www.alraedah.co',
//   PdfStandardFont(PdfFontFamily.courier, 10),
//   bounds: const Rect.fromLTWH(0, 750, 0, 0)
//   );
//   page2.graphics.drawString('$timestamp',
//   PdfStandardFont(PdfFontFamily.courier, 10),
//   bounds: const Rect.fromLTWH(320, 750, 0, 0)
//   );
//   // end footer
//   List<int> bytes = document.save();
//   document.dispose();
//   saveAndLaunchFile(bytes, 'Output.pdf');
// }
// Future<Uint8List> readImageData(String name) async {
//   final data = await rootBundle.load('assets/images/$name');
//   return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
// }
// // Future<PdfFontFamily> readFontData() async {
// //     final ByteData bytes = await rootBundle.load('assets/fonts/Almarai.ttf'); 
// //     var font = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes); 
// //     var fontt = font as PdfFontFamily;
// //     return fontt;
// // }
