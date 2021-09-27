// Eng Mouaz M. Al-Shahmeh
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sells_app/services/provider/buy_invoice_provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/services/provider/unit_provider.dart';
import 'package:sells_app/services/provider/user_provider.dart';

Future<void> printPdfSmall(BuildContext context) async {
  var buyInvoice = context.read<BuyInvoiceProvider>();
  var unitsProduct = context.read<UnitProductProvider>();
  var product = context.read<ProductProvider>();
  var user = context.read<UserProvider>();
  var unit = context.read<UnitProvider>();
  var tableData = <List<dynamic>>[];
  for (var i = 0; i < buyInvoice.invoiceDetailsList.length; i++) {
    tableData.add(<dynamic>[
      '${(double.tryParse(unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[i].unitProductId!}')! - 1].buyPrice!))!.toStringAsFixed(2)} ريال',
      '${buyInvoice.invoiceDetailsList[i].quantity}',
      '${unit.unitsList[unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[i].unitProductId!}')! - 1].productId! - 1].unitTitle} - ${product.productList[unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[i].unitProductId!}')! - 1].productId! - 1].productName}',
    ]);
  }
  final pw.Document pdf = pw.Document();
  var arabicFont = pw.Font.ttf(await rootBundle.load('assets/fonts/Arial.ttf'));
  String year = DateTime.now().year.toString();
  String month = DateTime.now().month.toString();
  String day = DateTime.now().day.toString();
  String hour = DateTime.now().hour.toString();
  String minute = DateTime.now().minute.toString();
  String second = DateTime.now().second.toString();
  var dataImage = await rootBundle.load('assets/images/logo.png');
  var logo = dataImage.buffer
      .asUint8List(dataImage.offsetInBytes, dataImage.lengthInBytes);
  final fileQr = buyInvoice.qrImageFile; // File
  final bytesQr = await fileQr!.readAsBytes(); // Unit8List
  var qrImage =
      bytesQr.buffer.asUint8List(bytesQr.offsetInBytes, bytesQr.lengthInBytes);
  // inch = 72.0  -- mm = inch / 25.4  -- pos w/h = 40.0 * 57
  pdf.addPage(pw.MultiPage(
      margin: pw.EdgeInsets.fromLTRB(5, 5, 5, 5),
      theme: pw.ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat(40.0 * (72.0 / 25.4), 57.0 * (72.0 / 25.4),
          marginAll: 8.0 * (72.0 / 25.4)),
      textDirection: pw.TextDirection.rtl,
      build: (context) {
        return [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Image(pw.MemoryImage(logo),
                  width: 70, height: 70, fit: pw.BoxFit.fill),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: pw.Text(
                  ' الرياض - المملكة العربية السعودية ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  '  جوال: 966545433006 ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  '  ايميل: info@alraedah.com ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  'https://www.alraedah.co',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  '  رقم السجل التجاري: xxxxxxxxxx ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 6,
                  ),
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  '  البطاقة الضريبية: xxxxxxxxxx ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
            ],
          ),
          pw.Divider(
            color: PdfColor.fromHex('#000000'),
            height: 15,
            thickness: 1,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  'فاتورة المبيعات',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  ' ${buyInvoice.userId == 0 ? 'لا يوجد' : user.userList[buyInvoice.userId! - 1].username} ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(fontSize: 8),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  'اسم العميل: ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),

            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: buyInvoice.invoiceIdPrint == 0
                    ? pw.Text('')
                    : pw.Text(
                        ' ${buyInvoice.invoiceIdPrint} ',
                        textAlign: pw.TextAlign.right,
                        style: pw.TextStyle(fontSize: 8),
                      ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  'رقم الفاتورة: ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: pw.Text(
                  '$year/$month/$day - $hour:$minute:$second ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 2, 0, 2),
                child: pw.Text(
                  'تاريخ الفاتورة: ',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(fontSize: 7),
                ),
              ),
            ],
          ),
          pw.Divider(
            color: PdfColor.fromHex('#000000'),
            height: 5,
            thickness: 1,
          ),
          pw.Table.fromTextArray(
            border: null,
            headerStyle: pw.TextStyle(
              fontSize: 7,
              color: PdfColor.fromHex('000000'),
            ),
            headerDecoration: pw.BoxDecoration(
              color: PdfColor.fromHex('#d9d9d9'),
            ),
            headers: <dynamic>[
              'سعر بيع الوحدة',
              'الكمية',
              'المنتج',
            ],
            cellAlignment: pw.Alignment.center,
            cellStyle: pw.TextStyle(fontSize: 6),
            data: tableData,
          ),
          pw.Divider(
            color: PdfColor.fromHex('#000000'),
            height: 5,
            thickness: 1,
          ),
          pw.Table.fromTextArray(
            border: null,
            headerStyle: pw.TextStyle(
              fontSize: 8,
              color: PdfColor.fromHex('000000'),
            ),
            headerDecoration: pw.BoxDecoration(
              color: PdfColor.fromHex('#d9d9d9'),
            ),
            headers: <dynamic>[
              '${buyInvoice.totalBeforeDiscount.toStringAsFixed(2)} ريال',
              'قبل الخصم',
            ],
            cellAlignment: pw.Alignment.center,
            cellStyle: pw.TextStyle(fontSize: 8),
            data: <List<dynamic>>[
              <dynamic>[],
            ],
          ),
          pw.Divider(
            color: PdfColor.fromHex('#ffffff'),
            height: 3,
            thickness: 1,
          ),
          pw.Table.fromTextArray(
            border: null,
            headerStyle: pw.TextStyle(
              fontSize: 8,
              color: PdfColor.fromHex('000000'),
            ),
            headerDecoration: pw.BoxDecoration(
              color: PdfColor.fromHex('#ffffff'),
            ),
            headers: <dynamic>[
              '${buyInvoice.discountFixedAmount.toStringAsFixed(2)} ريال ',
              'قيمة الخصم',
            ],
            cellAlignment: pw.Alignment.bottomRight,
            cellStyle: pw.TextStyle(fontSize: 8),
            data: <List<dynamic>>[
              <dynamic>[],
            ],
          ),
          pw.Divider(
            color: PdfColor.fromHex('#ffffff'),
            height: 3,
            thickness: 1,
          ),
          pw.Table.fromTextArray(
            border: null,
            headerStyle: pw.TextStyle(
              fontSize: 8,
              color: PdfColor.fromHex('000000'),
            ),
            headerDecoration: pw.BoxDecoration(
              color: PdfColor.fromHex('#d9d9d9'),
            ),
            headers: <dynamic>[
              '${buyInvoice.totalAfterDiscount.toStringAsFixed(2)} ريال',
              'بعد الخصم',
            ],
            cellAlignment: pw.Alignment.center,
            cellStyle: pw.TextStyle(fontSize: 8),
            data: <List<dynamic>>[
              <dynamic>[],
            ],
          ),
          pw.Divider(
            color: PdfColor.fromHex('#ffffff'),
            height: 3,
            thickness: 1,
          ),
          pw.Table.fromTextArray(
            border: null,
            headerStyle: pw.TextStyle(
              fontSize: 6,
              color: PdfColor.fromHex('000000'),
            ),
            headerDecoration: pw.BoxDecoration(
              color: PdfColor.fromHex('#ffffff'),
            ),
            headers: <dynamic>[
              ' ${buyInvoice.vatValue.toStringAsFixed(2)} ريال ',
              'قيمة الضريبة المضافة',
            ],
            cellAlignment: pw.Alignment.center,
            cellStyle: pw.TextStyle(fontSize: 6),
            data: <List<dynamic>>[
              <dynamic>[],
            ],
          ),
          pw.Divider(
            color: PdfColor.fromHex('#000000'),
            height: 3,
            thickness: 1,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: pw.Text(
                  'الاجمالي النهائي: ${buyInvoice.totalAfterVAT.toStringAsFixed(2)} ريال',
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(fontSize: 7),
                ),
              ),
            ],
          ),
          pw.Divider(
            color: PdfColor.fromHex('#000000'),
            height: 3,
            thickness: 1,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: pw.Image(
                  pw.MemoryImage(qrImage),
                  width: 60,
                  height: 60,
                  fit: pw.BoxFit.fill,
                ),
              ),
            ],
          ),
        ];
      }));

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/document.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => await pdf.save(),
  );
}
