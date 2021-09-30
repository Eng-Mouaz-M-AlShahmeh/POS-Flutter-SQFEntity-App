// Eng Mouaz M. Al-Shahmeh
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/buy_invoice_nav.dart';
import 'package:sells_app/common/on_close_invoice.dart';
import 'package:sells_app/common/searchProductsField.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/texts.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/repositories/orm_config.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/buy_invoice_provider.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';
import 'package:sells_app/services/provider/unit_provider.dart';

class AddBuyInvoiceProducts extends StatelessWidget {
  const AddBuyInvoiceProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    var category = context.watch<CategoryProvider>();
    var product = context.watch<ProductProvider>();
    var unit = context.watch<UnitProvider>();
    var unitproduct = context.watch<UnitProductProvider>();
    var buyInvoice = context.watch<BuyInvoiceProvider>();

    return WillPopScope(
      onWillPop: () => onCloseInvoice(context),
      child: Scaffold(
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
                              AppLocalizations.of(context)
                                  .translate('add_invoice')!,
                              textAlign: TextAlign.center,
                              style: invoiceHeaderStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SearchProductsField(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: category.categoryList.length,
                        itemBuilder: (context, index) => TextButton(
                          onPressed: () {
                            product.filterProductsByCategory(
                                category.categoryList[index].id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              '${category.categoryList[index].categoryTitle}',
                              style: categoryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: GridView.builder(
                        itemCount: product.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                (orientation == Orientation.portrait) ? 3 : 4),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextButton(
                              onPressed: () {
                                // unitproduct.setProductIdInvoice(product.productList[index].id!);
                                unitproduct.getSelectedUnitsProduct(
                                    product.productList[index].id);

                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      color: bgColorRegular,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                  child: Icon(
                                                    Icons.cancel,
                                                    color:
                                                        appTheme.primaryColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '',
                                                    style: appTheme
                                                        .textTheme.headline5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: ListView.builder(
                                                itemCount: unitproduct
                                                    .productSelectedUnitsList
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        15, 0, 15, 15),
                                                    child: Card(
                                                      child: Container(
                                                        height: 85,
                                                        child: Column(
                                                          children: [
                                                            Consumer<
                                                                BuyInvoiceProvider>(
                                                              builder: (context,
                                                                  buyInvoice,
                                                                  child) {
                                                                return buyInvoice
                                                                            .showUnitsList[index] ==
                                                                        true
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () {
                                                                                buyInvoice.setUnitProductIdInvoice(unitproduct.productSelectedUnitsList[index].id!);

                                                                                if (buyInvoice.invoiceDetailsList.isNotEmpty) {
                                                                                  if (unitproduct.productSelectedUnitsList[index].id! <= buyInvoice.invoiceDetailsList.length) {
                                                                                    if (double.tryParse('${int.tryParse('${buyInvoice.invoiceDetailsList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')! + 1}')! <= double.tryParse('${unitproduct.unitsProductList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')!) {
                                                                                      buyInvoice.increaseUnitProductInInvoiceList(
                                                                                        context,
                                                                                        InvoiceDetail(
                                                                                          invoiceId: '1',
                                                                                          unitProductId: buyInvoice.unitProductIdInvoiceDsc.toString(),
                                                                                          quantity: '1',
                                                                                        ),
                                                                                        buyInvoice.unitProductIdInvoiceDsc!,
                                                                                        buyInvoice.invoiceDetailsList.isNotEmpty
                                                                                            ? unitproduct.productSelectedUnitsList[index].id! <= buyInvoice.invoiceDetailsList.length
                                                                                                ? int.tryParse('${buyInvoice.invoiceDetailsList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')! + 1
                                                                                                : 1
                                                                                            : 1,
                                                                                      );
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        const SnackBar(
                                                                                          content: Text(role6),
                                                                                          backgroundColor: Colors.red,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    buyInvoice.increaseUnitProductInInvoiceList(
                                                                                      context,
                                                                                      InvoiceDetail(
                                                                                        invoiceId: '1',
                                                                                        unitProductId: buyInvoice.unitProductIdInvoiceDsc.toString(),
                                                                                        quantity: '1',
                                                                                      ),
                                                                                      buyInvoice.unitProductIdInvoiceDsc!,
                                                                                      1,
                                                                                    );
                                                                                  }
                                                                                } else {
                                                                                  buyInvoice.increaseUnitProductInInvoiceList(
                                                                                    context,
                                                                                    InvoiceDetail(
                                                                                      invoiceId: '1',
                                                                                      unitProductId: buyInvoice.unitProductIdInvoiceDsc.toString(),
                                                                                      quantity: '1',
                                                                                    ),
                                                                                    buyInvoice.unitProductIdInvoiceDsc!,
                                                                                    1,
                                                                                  );
                                                                                }
                                                                              },
                                                                              child: Icon(
                                                                                Icons.add_circle_outline,
                                                                                color: appTheme.primaryColor,
                                                                                size: 30,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                height: 40,
                                                                                child: Consumer<UnitProductProvider>(
                                                                                  builder: (context, unitproduct, child) {
                                                                                    final List<TextEditingController> _quantityController = List.generate(
                                                                                        unitproduct.unitsProductList.length,
                                                                                        (index) => TextEditingController(
                                                                                              text: buyInvoice.invoiceDetailsList.isNotEmpty
                                                                                                  ? unitproduct.unitsProductList.isNotEmpty
                                                                                                      ? unitproduct.unitsProductList[index].id! <= buyInvoice.invoiceDetailsList.length
                                                                                                          ? '${buyInvoice.invoiceDetailsList[unitproduct.unitsProductList[index].id! - 1].quantity}'
                                                                                                          : '0'
                                                                                                      : '0'
                                                                                                  : '0',
                                                                                            ));

                                                                                    return TextFormField(
                                                                                      decoration: textInputDecoration,
                                                                                      keyboardType: TextInputType.numberWithOptions(decimal: false),
                                                                                      controller: _quantityController[unitproduct.productSelectedUnitsList[index].id! - 1],
                                                                                      onChanged: (val) {
                                                                                        buyInvoice.setUnitProductIdInvoice(unitproduct.productSelectedUnitsList[index].id!);
                                                                                        buyInvoice.setQuantityInput(int.tryParse(val)!);
                                                                                        if (unitproduct.productSelectedUnitsList[index].id! <= buyInvoice.invoiceDetailsList.length) {
                                                                                          if (double.tryParse('${buyInvoice.quantityInput!}')! <= double.tryParse('${unitproduct.unitsProductList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')!) {
                                                                                            buyInvoice.updateUnitProductInInvoiceListQuantity(
                                                                                              context,
                                                                                              InvoiceDetail(
                                                                                                invoiceId: '1',
                                                                                                unitProductId: buyInvoice.unitProductIdInvoiceDsc.toString(),
                                                                                                quantity: buyInvoice.quantityInput.toString(),
                                                                                              ),
                                                                                              buyInvoice.unitProductIdInvoiceDsc!,
                                                                                              buyInvoice.quantityInput!,
                                                                                            );
                                                                                          } else {
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              const SnackBar(
                                                                                                content: Text(role6),
                                                                                                backgroundColor: Colors.red,
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        }
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () {
                                                                                buyInvoice.setUnitProductIdInvoice(unitproduct.productSelectedUnitsList[index].id!);
                                                                                buyInvoice.decreaseUnitProductInInvoiceList(
                                                                                  context,
                                                                                  buyInvoice.unitProductIdInvoiceDsc!,
                                                                                  buyInvoice.invoiceDetailsList.isNotEmpty
                                                                                      ? unitproduct.productSelectedUnitsList[index].id! <= buyInvoice.invoiceDetailsList.length
                                                                                          ? int.tryParse('${buyInvoice.invoiceDetailsList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')! - 1
                                                                                          : 0
                                                                                      : 0,
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.remove_circle_outline,
                                                                                color: danger,
                                                                                size: 30,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : Container();
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  buyInvoice.setUnitProductIdInvoice(
                                                                      unitproduct
                                                                          .productSelectedUnitsList[
                                                                              index]
                                                                          .id!);

                                                                  if (buyInvoice
                                                                      .invoiceDetailsList
                                                                      .isNotEmpty) {
                                                                    if (unitproduct
                                                                            .productSelectedUnitsList[
                                                                                index]
                                                                            .id! <=
                                                                        buyInvoice
                                                                            .invoiceDetailsList
                                                                            .length) {
                                                                      if (double.tryParse(
                                                                              '${int.tryParse('${buyInvoice.invoiceDetailsList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')! + 1}')! <=
                                                                          double.tryParse(
                                                                              '${unitproduct.unitsProductList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')!) {
                                                                        buyInvoice
                                                                            .increaseUnitProductInInvoiceList(
                                                                          context,
                                                                          InvoiceDetail(
                                                                            invoiceId:
                                                                                '1',
                                                                            unitProductId:
                                                                                buyInvoice.unitProductIdInvoiceDsc.toString(),
                                                                            quantity:
                                                                                '1',
                                                                          ),
                                                                          buyInvoice
                                                                              .unitProductIdInvoiceDsc!,
                                                                          buyInvoice.invoiceDetailsList.isNotEmpty
                                                                              ? unitproduct.productSelectedUnitsList[index].id! <= buyInvoice.invoiceDetailsList.length
                                                                                  ? int.tryParse('${buyInvoice.invoiceDetailsList[unitproduct.productSelectedUnitsList[index].id! - 1].quantity!}')! + 1
                                                                                  : 1
                                                                              : 1,
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          const SnackBar(
                                                                            content:
                                                                                Text(role6),
                                                                            backgroundColor:
                                                                                Colors.red,
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      buyInvoice
                                                                          .increaseUnitProductInInvoiceList(
                                                                        context,
                                                                        InvoiceDetail(
                                                                          invoiceId:
                                                                              '1',
                                                                          unitProductId: buyInvoice
                                                                              .unitProductIdInvoiceDsc
                                                                              .toString(),
                                                                          quantity:
                                                                              '1',
                                                                        ),
                                                                        buyInvoice
                                                                            .unitProductIdInvoiceDsc!,
                                                                        1,
                                                                      );
                                                                    }
                                                                  } else {
                                                                    buyInvoice
                                                                        .increaseUnitProductInInvoiceList(
                                                                      context,
                                                                      InvoiceDetail(
                                                                        invoiceId:
                                                                            '1',
                                                                        unitProductId: buyInvoice
                                                                            .unitProductIdInvoiceDsc
                                                                            .toString(),
                                                                        quantity:
                                                                            '1',
                                                                      ),
                                                                      buyInvoice
                                                                          .unitProductIdInvoiceDsc!,
                                                                      1,
                                                                    );
                                                                  }

                                                                  if (buyInvoice
                                                                              .showUnitsList[
                                                                          index] ==
                                                                      false) {
                                                                    buyInvoice
                                                                        .isShowUnitsList(
                                                                            index);
                                                                  }
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    '${unit.unitsList[unitproduct.productSelectedUnitsList[index].unitId! - 1].unitTitle}',
                                                                    style:
                                                                        unitText,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: GridTile(
                                  footer: Opacity(
                                    opacity: 0.8,
                                    child: Container(
                                      height: 55,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${product.productList[index].productName!}',
                                              style:
                                                  appTheme.textTheme.headline5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  child: product.productList[index].imageUrl ==
                                          null
                                      ? Image.asset(
                                          'assets/images/product_img.png')
                                      : Image.file(File(product
                                          .productList[index].imageUrl!)),
                                ),
                              ),
                            ),
                          );
                        },
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
      ),
    );
  }
}
