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
import 'package:sells_app/services/provider/user_provider.dart';

Future<void> printPdfA4(BuildContext context) async {
  var buyInvoice = context.read<BuyInvoiceProvider>();
  var unitsProduct = context.read<UnitProductProvider>();
  var product = context.read<ProductProvider>();
  var user = context.read<UserProvider>();
  var tableData = <List<dynamic>>[];
  for (var i = 0; i < buyInvoice.invoiceDetailsList.length; i++) {
    tableData.add(<dynamic>[
      '${(double.tryParse("${buyInvoice.invoiceDetailsList[i].quantity!}")! * num.tryParse("${unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[i].unitProductId!}')! - 1].buyPrice}")!).toStringAsFixed(2)} ريال',
      '${buyInvoice.invoiceDetailsList[i].quantity}',
      '${(double.tryParse(unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[i].unitProductId!}')! - 1].buyPrice!))!.toStringAsFixed(2)} ريال',
      '${product.productList[unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[i].unitProductId!}')! - 1].productId! - 1].productName}',
      '${i + 1}'
    ]);
  }
  final pw.Document pdf = pw.Document();
  var arabicFont = pw.Font.ttf(await rootBundle.load('assets/fonts/Arial.ttf'));
  String timestamp = DateTime.now().toString();
  var dataImage = await rootBundle.load('assets/images/logo.png');
  var logo = dataImage.buffer
      .asUint8List(dataImage.offsetInBytes, dataImage.lengthInBytes);
  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.fromLTRB(30, 30, 30, 30),
      header: (context) {
        return pw.Align(
          alignment: pw.Alignment.topCenter,
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        '  رقم السجل التجاري: xxxxxxxxxx ',
                        style: pw.TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      pw.Text(
                        '  البطاقة الضريبية: xxxxxxxxxx ',
                        style: pw.TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  pw.Image(pw.MemoryImage(logo),
                      width: 100, height: 100, fit: pw.BoxFit.fill),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        '  شركة الرائدة الكبرى ',
                        style: pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        '  حي المرسلات - الرياض - المملكة العربية السعودية ',
                        style: pw.TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      pw.Text(
                        '  جوال: 966545433006 ',
                        style: pw.TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      pw.Text(
                        '  ايميل: info@alraedah.com ',
                        style: pw.TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromHex('#707070')),
            ],
          ),
        );
      },
      footer: (context) {
        return pw.Align(
          alignment: pw.Alignment.bottomCenter,
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Divider(color: PdfColor.fromHex('#707070')),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    '$timestamp',
                    style: pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    'https://www.alraedah.co',
                    style: pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      theme: pw.ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat.a4,
      textDirection: pw.TextDirection.rtl,
      build: (pw.Context context) {
        return [
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text('فاتورة المبيعات',
                        style: pw.TextStyle(fontSize: 20)),
                    pw.Container(
                      margin: pw.EdgeInsets.fromLTRB(300, 10, 0, 10),
                      child: pw.Text(
                        'اسم العميل: ${buyInvoice.userId == 0 ? 'لا يوجد' : user.userList[buyInvoice.userId! - 1].username}',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Divider(
                              color: PdfColor.fromHex('#707070'), height: 1),
                          pw.Table.fromTextArray(
                            border: null,
                            headerStyle: pw.TextStyle(
                              fontSize: 16,
                              color: PdfColor.fromHex('ffffff'),
                            ),
                            headerDecoration: pw.BoxDecoration(
                              color: PdfColor.fromHex('989898'),
                            ),
                            headers: <dynamic>[
                              'الإجمالي',
                              'الكمية',
                              'سعر البيع',
                              'اسم المنتج',
                              '#'
                            ],
                            cellAlignment: pw.Alignment.center,
                            cellStyle: pw.TextStyle(fontSize: 16),
                            data: tableData,
                          ),
                          pw.Divider(
                              color: PdfColor.fromHex('#707070'), height: 1),
                        ],
                      ),
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.fromLTRB(0, 10, 200, 10),
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Divider(
                              color: PdfColor.fromHex('#707070'), height: 1),
                          pw.Table.fromTextArray(
                            border: null,
                            headerStyle: pw.TextStyle(
                              fontSize: 14,
                              color: PdfColor.fromHex('ffffff'),
                            ),
                            headerDecoration: pw.BoxDecoration(
                              color: PdfColor.fromHex('989898'),
                            ),
                            headers: <dynamic>[
                              'قيمة الضريبة المضافة',
                              'الاجمالي بعد الخصم',
                              'مبلغ الخصم',
                              'الاجمالي قبل الخصم',
                            ],
                            cellAlignment: pw.Alignment.center,
                            cellStyle: pw.TextStyle(fontSize: 14),
                            data: <List<dynamic>>[
                              <dynamic>[
                                '${buyInvoice.vatValue.toStringAsFixed(2)} ريال',
                                '${buyInvoice.totalAfterDiscount.toStringAsFixed(2)} ريال',
                                '${buyInvoice.discountFixedAmount.toStringAsFixed(2)}',
                                '${buyInvoice.totalBeforeDiscount.toStringAsFixed(2)} ريال',
                              ],
                            ],
                          ),
                          pw.Divider(
                              color: PdfColor.fromHex('#707070'), height: 1),
                        ],
                      ),
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.fromLTRB(0, 10, 300, 10),
                      child: pw.Text(
                        'الاجمالي النهائي: ${buyInvoice.totalAfterVAT.toStringAsFixed(2)} ريال',
                        style: pw.TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ];
      },
    ),
  );
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/document.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => await pdf.save(),
  );
}
