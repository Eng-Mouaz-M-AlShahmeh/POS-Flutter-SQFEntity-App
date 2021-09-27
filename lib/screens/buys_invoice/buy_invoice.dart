// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/buy_invoice_nav.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/buys_invoice/buy_payment.dart';
import 'package:sells_app/services/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/services/provider/buy_invoice_provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';

class BuyInvoice extends StatelessWidget {
  const BuyInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = context.watch<AppProvider>();
    var unitsProduct = context.watch<UnitProductProvider>();
    var buyInvoice = context.watch<BuyInvoiceProvider>();
    var product = context.watch<ProductProvider>();

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: appTheme.backgroundColor,
              child: Image(
                image: AssetImage('assets/images/bg2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'الفاتورة',
                            textAlign: TextAlign.center,
                            style: invoiceHeaderStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      color: appTheme.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Table(
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  'اسم المنتج',
                                  style: tableHeader,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'سعر البيع',
                                  style: tableHeader,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'الكمية',
                                  style: tableHeader,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'الإجمالي',
                                  style: tableHeader,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: ListView.builder(
                      itemCount: buyInvoice.invoiceDetailsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [

                                            Text(
                                              '${product.productList[unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[index].unitProductId!}')! - 1].productId! - 1].productName}',
                                              style: imageButtonText,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[index].unitProductId!}')! - 1].buyPrice}',
                                              style: imageButtonText,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${buyInvoice.invoiceDetailsList[index].quantity}',
                                              style: imageButtonText,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${(double.tryParse("${buyInvoice.invoiceDetailsList[index].quantity!}")! * num.tryParse("${unitsProduct.unitsProductList[int.tryParse('${buyInvoice.invoiceDetailsList[index].unitProductId!}')! - 1].buyPrice}")!).toStringAsFixed(2)}',
                                              style: imageButtonText,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.045,
                    decoration: BoxDecoration(
                      color: appTheme.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Table(
                          children: [
                            TableRow(
                              children: [
                                Consumer<BuyInvoiceProvider>(
                                  builder: (context, buyInvoice, child) {
                                    return Text(
                                      'الإجمالي: ${buyInvoice.total.toStringAsFixed(2)} ريال',
                                      style: tableHeader,
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: buttonColorRegular,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          appProvider.setInvoiceNavIndex(2);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuyPayment(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'إتمام الدفع',
                                    style: tableHeader,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: buyInvoiceBNav(context),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
