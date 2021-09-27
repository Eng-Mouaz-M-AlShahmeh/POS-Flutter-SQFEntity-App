// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/searchProductsField.dart';
import 'package:sells_app/common/theme.dart';
// import 'package:sells_app/repositories/orm_config.dart';
import 'package:sells_app/screens/products/add_product.dart';
import 'package:sells_app/screens/products/edit_product.dart';
import 'package:sells_app/screens/products/product_page.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';
import 'package:sells_app/services/provider/unit_provider.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = context.watch<ProductProvider>();
    var category = context.watch<CategoryProvider>();
    var unitsProduct = context.watch<UnitProductProvider>();
    var unit = context.watch<UnitProvider>();

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
                            'المنتجات',
                            textAlign: TextAlign.center,
                            style: appTheme.textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProduct(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            'إضافة منتج جديد',
                            style: addNewText,
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
                                  'التصنيف',
                                  style: tableHeader,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'الإجراءات',
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
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: ListView.builder(
                      itemCount: product.productList.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Table(
                                  children: [
                                    TableRow(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              child: Icon(
                                                product.isOpenListRecord[index]
                                                    ? Icons.remove_circle
                                                    : Icons.add_circle,
                                                color: appTheme.primaryColor,
                                              ),
                                              onTap: () {

                                                unitsProduct
                                                    .getSelectedUnitsProduct(
                                                        product
                                                            .productList[index]
                                                            .id);
                                                product
                                                    .setIsOpenListRecord(index);
                                              },
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${product.productList[index].productName}',
                                              style:
                                                  appTheme.textTheme.headline5,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          product.productList[index].catId != '0'
                                              ? '${category.categoryList[int.tryParse(product.productList[index].catId!)! - 1].categoryTitle}'
                                              : 'لا يوجد',
                                          style: appTheme.textTheme.headline5,
                                          textAlign: TextAlign.center,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                child: Icon(
                                                  Icons.info_outlined,
                                                  color: tealInfo,
                                                ),
                                                onTap: () {
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductPage(),
                                                    ),
                                                    (route) => false,
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                child: Icon(
                                                  Icons.edit,
                                                  color: appTheme.primaryColor,
                                                ),
                                                onTap: () {
                                                  product.setEditProductId(
                                                      product.productList[index]
                                                          .id!);
                                                  unitsProduct
                                                      .getAllUnitsProductEdit();

                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditProduct(),
                                                    ),
                                                    (route) => false,
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: danger,
                                                ),
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (_) => AlertDialog(
                                                                title: Text(
                                                                  'هل انت متاكد من حذف السجل؟',
                                                                  style: appTheme
                                                                      .textTheme
                                                                      .headline3,
                                                                ),
                                                                content:
                                                                    Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          child:
                                                                              Text(
                                                                            'إلغاء',
                                                                            style:
                                                                                noDeleteButtonText,
                                                                          ),
                                                                          onTap: () =>
                                                                              Navigator.pop(context),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20.0,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          child:
                                                                              Text(
                                                                            'تأكيد',
                                                                            style:
                                                                                yesDeleteButtonText,
                                                                          ),
                                                                          onTap: () async {

                                                                            await unitsProduct.deleteUnitsProduct(product.productList[index].id);
                                                                            await product.deleteProduct(index);
                                                                            product.closeAllListRecord();

                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              const SnackBar(
                                                                                content: Text('تم حذف مستند بنجاح'),
                                                                                backgroundColor: Colors.orange,
                                                                              ),
                                                                            );
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          product.isOpenListRecord[index]
                              ? SizedBox(
                                  height: 5,
                                )
                              : Container(),
                          product.isOpenListRecord[index]
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: invoiceBGColorLight,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
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
                                                  'اسم الوحدة',
                                                  style: tableHeaderSub,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'سعر البيع',
                                                  style: tableHeaderSub,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'سعر الشراء',
                                                  style: tableHeaderSub,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'الكمية',
                                                  style: tableHeaderSub,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          product.isOpenListRecord[index]
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ListView.builder(
                                        itemCount: unitsProduct
                                            .productSelectedUnitsList.length,
                                        itemBuilder: (context, unitsIndex) =>
                                            Column(
                                          children: [
                                            unitsProduct
                                                        .productSelectedUnitsList[
                                                            unitsIndex]
                                                        .productId ==
                                                    product
                                                        .productList[index].id
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(5, 0, 5, 5),
                                                    child: Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: invoiceBGColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5.0),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Table(
                                                            children: [
                                                              TableRow(
                                                                children: [
                                                                  Text(
                                                                    unitsProduct.productSelectedUnitsList[unitsIndex].unitId! < unit.unitsList.length ?
                                                                    '${unit.unitsList[unitsProduct.productSelectedUnitsList[unitsIndex].unitId! -1 ].unitTitle}' :
                                                                    '${unit.unitsList[unitsProduct.productSelectedUnitsList[unitsIndex].unitId! - 2].unitTitle}',
                                                                    style:
                                                                        tableHeader,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Text(
                                                                    '${unitsProduct.productSelectedUnitsList[unitsIndex].buyPrice}',
                                                                    style:
                                                                        tableHeader,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Text(
                                                                    '${unitsProduct.productSelectedUnitsList[unitsIndex].sellPrice}',
                                                                    style:
                                                                        tableHeader,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Text(
                                                                    '${unitsProduct.productSelectedUnitsList[unitsIndex].quantity}',
                                                                    style:
                                                                        tableHeader,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
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
