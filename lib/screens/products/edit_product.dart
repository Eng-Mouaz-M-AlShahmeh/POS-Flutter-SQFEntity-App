// Eng Mouaz M. Al-Shahmeh
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_form.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/texts.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/repositories/orm_config.dart' as orm;
import 'package:sells_app/screens/products/index.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';
import 'package:sells_app/services/provider/unit_provider.dart';

class EditProduct extends StatelessWidget {
  EditProduct({Key? key}) : super(key: key);

  final GlobalKey<FormState> _editunitProductDscKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _editUnitProductKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var productProvider = context.watch<ProductProvider>();
    var unitProduct = context.watch<UnitProductProvider>();
    var category = context.watch<CategoryProvider>();
    var unit = context.read<UnitProvider>();
    final orientation = MediaQuery.of(context).orientation;

    final TextEditingController _barcodeController =
        TextEditingController(text: unitProduct.barcodeEdit);
    _barcodeController.value = _barcodeController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.barcodeEdit!.length),
      ),
    );

    final TextEditingController _quantityController =
        TextEditingController(text: unitProduct.quantityEdit);
    _quantityController.value = _quantityController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.quantityEdit!.length),
      ),
    );

    final TextEditingController _sellPriceController =
        TextEditingController(text: unitProduct.sellPriceEdit);
    _sellPriceController.value = _sellPriceController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.sellPriceEdit!.length),
      ),
    );

    final TextEditingController _buyPriceController =
        TextEditingController(text: unitProduct.buyPriceEdit);
    _buyPriceController.value = _buyPriceController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.buyPriceEdit!.length),
      ),
    );

    final TextEditingController _descriptionController =
        TextEditingController(text: unitProduct.descriptionEdit);
    _descriptionController.value = _descriptionController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.descriptionEdit!.length),
      ),
    );

    final TextEditingController _productNameController =
        TextEditingController(text: productProvider.productNameEdit);
    _productNameController.value = _productNameController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: productProvider.productNameEdit!.length),
      ),
    );

    final TextEditingController _productNumberController =
        TextEditingController(text: productProvider.productNumEdit);
    _productNumberController.value = _productNumberController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: productProvider.productNumEdit!.length),
      ),
    );

    final TextEditingController _productDescriptionController =
        TextEditingController(text: productProvider.descriptionEdit);
    _productDescriptionController.value =
        _productDescriptionController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: productProvider.descriptionEdit!.length),
      ),
    );

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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Form(
                key: _editUnitProductKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'تعديل منتج',
                      style: appTheme.textTheme.headline2,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: TextButton(
                                      style: buttonForm,
                                      onPressed: () {
                                        productProvider
                                            .onImageButtonPressedEdit(
                                          ImageSource.gallery,
                                        );
                                      },
                                      child: Consumer<ProductProvider>(
                                        builder: (context, picked, child) =>
                                            defaultTargetPlatform ==
                                                    TargetPlatform.android
                                                ? FutureBuilder<void>(
                                                    future: picked
                                                        .retrieveLostDataEdit(),
                                                    builder:
                                                        (BuildContext context,
                                                            AsyncSnapshot<void>
                                                                snapshot) {
                                                      switch (snapshot
                                                          .connectionState) {
                                                        case ConnectionState
                                                            .none:
                                                        case ConnectionState
                                                            .waiting:
                                                          return Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.image,
                                                                size: 40,
                                                              ),
                                                            ],
                                                          );
                                                        case ConnectionState
                                                            .done:
                                                          return Container(
                                                              width: 150,
                                                              height: 150,
                                                              child: picked
                                                                  .handlePreviewEdit());
                                                        default:
                                                          if (snapshot
                                                              .hasError) {
                                                            return Text(
                                                              'خطأ التقاط الصورة: ${snapshot.error}}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            );
                                                          } else {
                                                            return Icon(
                                                              Icons.image,
                                                              size: 40,
                                                            );
                                                          }
                                                      }
                                                    },
                                                  )
                                                : Container(
                                                    width: 150,
                                                    height: 150,
                                                    child: picked
                                                        .handlePreviewEdit()),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'اسم المنتج',
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return requieredFeild;
                                }
                                return null;
                              },
                              controller: _productNameController,
                              onChanged: (val) =>
                                  productProvider.setProductNameEdit(val),
                              onSaved: (val) =>
                                  productProvider.setProductNameEdit(val),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'رقم المنتج',
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return requieredFeild;
                                }
                                return null;
                              },
                              controller: _productNumberController,
                              onChanged: (val) =>
                                  productProvider.setProductNumEdit(val),
                              onSaved: (val) =>
                                  productProvider.setProductNumEdit(val),
                            ),
                            SizedBox(height: 10.0),
                            DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                alignedDropdown: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButton(
                                      hint: Text(
                                        'اختر التصنيف',
                                        style: appTheme.textTheme.headline5,
                                      ),
                                      value: productProvider.catIdEdit,
                                      items: <DropdownMenuItem<int>>[
                                            DropdownMenuItem<int>(
                                              value: 0,
                                              child: Text(
                                                'لا يوجد',
                                                style: appTheme
                                                    .textTheme.headline5,
                                              ),
                                            )
                                          ] +
                                          category.categoryList
                                              .map<DropdownMenuItem<int>>(
                                                  (orm.Category value) {
                                            return DropdownMenuItem<int>(
                                              value: value.id,
                                              child: Text(
                                                '${value.categoryTitle}',
                                                style: appTheme
                                                    .textTheme.headline5,
                                              ),
                                            );
                                          }).toList(),
                                      onChanged: (int? val) =>
                                          productProvider.setCatIdEdit(val),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 15, 15, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'اختر الوحدات للمنتج',
                                          style: appTheme.textTheme.headline5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: GridView.builder(
                                      itemCount: unit.unitsList.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: (orientation ==
                                                      Orientation.portrait)
                                                  ? 3
                                                  : 4),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        unitProduct.isUnitCheckedListEdit(
                                            unit.unitsList[index].id!,
                                            productProvider.editProductId!,
                                            index);

                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 15),
                                          child: TextButton(
                                            onPressed: () {
                                              unitProduct
                                                  .setSelectedUnitProductEdit(
                                                productProvider.editProductId,
                                                unit.unitsList[index].id,
                                              );

                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Dialog(
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.8,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    color: bgColorRegular,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  15,
                                                                  15,
                                                                  15,
                                                                  0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child: Icon(
                                                                  Icons.cancel,
                                                                  color: appTheme
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'ادخل تفاصيل الوحدة للمنتج',
                                                                  style: appTheme
                                                                      .textTheme
                                                                      .headline5,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Form(
                                                                key:
                                                                    _editunitProductDscKey,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Card(
                                                                      color: Colors
                                                                          .white,
                                                                      elevation:
                                                                          2,
                                                                      shadowColor:
                                                                          appTheme
                                                                              .primaryColor,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            BarcodeWidget(
                                                                          barcode:
                                                                              Barcode.code128(),
                                                                          data:
                                                                              unitProduct.barcodeEdit!,
                                                                          width:
                                                                              150,
                                                                          height:
                                                                              40,
                                                                          drawText:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10.0),
                                                                    TextFormField(
                                                                      decoration:
                                                                          textInputDecoration
                                                                              .copyWith(
                                                                        labelText:
                                                                            'الباركود',
                                                                      ),
                                                                      controller:
                                                                          _barcodeController,
                                                                      validator:
                                                                          (String?
                                                                              value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return requieredFeild;
                                                                        }
                                                                        return null;
                                                                      },
                                                                      onChanged:
                                                                          (val) =>
                                                                              unitProduct.setBarcodeEdit(val),
                                                                      onSaved: (val) =>
                                                                          unitProduct
                                                                              .setBarcodeEdit(val),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10.0),
                                                                    TextFormField(
                                                                      decoration:
                                                                          textInputDecoration
                                                                              .copyWith(
                                                                        labelText:
                                                                            'الكمية',
                                                                      ),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      controller:
                                                                          _quantityController,
                                                                      validator:
                                                                          (String?
                                                                              value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return requieredFeild;
                                                                        }
                                                                        return null;
                                                                      },
                                                                      onChanged:
                                                                          (val) =>
                                                                              unitProduct.setQuantityEdit(val),
                                                                      onSaved: (val) =>
                                                                          unitProduct
                                                                              .setQuantityEdit(val),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10.0),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              TextFormField(
                                                                            decoration:
                                                                                textInputDecoration.copyWith(
                                                                              labelText: 'سعر البيع',
                                                                            ),
                                                                            keyboardType:
                                                                                TextInputType.numberWithOptions(decimal: true),
                                                                            controller:
                                                                                _buyPriceController,
                                                                            validator:
                                                                                (String? value) {
                                                                              if (value!.isEmpty) {
                                                                                return requieredFeild;
                                                                              }
                                                                              return null;
                                                                            },
                                                                            onChanged: (val) =>
                                                                                unitProduct.setBuyPriceEdit(val),
                                                                            onSaved: (val) =>
                                                                                unitProduct.setBuyPriceEdit(val),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                10.0),
                                                                        Expanded(
                                                                          child:
                                                                              TextFormField(
                                                                            decoration:
                                                                                textInputDecoration.copyWith(
                                                                              labelText: 'سعر الشراء',
                                                                            ),
                                                                            keyboardType:
                                                                                TextInputType.numberWithOptions(decimal: true),
                                                                            controller:
                                                                                _sellPriceController,
                                                                            validator:
                                                                                (String? value) {
                                                                              if (value!.isEmpty) {
                                                                                return requieredFeild;
                                                                              }
                                                                              return null;
                                                                            },
                                                                            onChanged: (val) =>
                                                                                unitProduct.setSellPriceEdit(val),
                                                                            onSaved: (val) =>
                                                                                unitProduct.setSellPriceEdit(val),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10.0),
                                                                    TextFormField(
                                                                      minLines:
                                                                          6,
                                                                      maxLines:
                                                                          6,
                                                                      decoration:
                                                                          textInputDecoration
                                                                              .copyWith(
                                                                        labelText:
                                                                            'ملاحظات',
                                                                      ),
                                                                      controller:
                                                                          _descriptionController,
                                                                      onChanged:
                                                                          (val) =>
                                                                              unitProduct.setDescriptionEdit(val),
                                                                      onSaved: (val) =>
                                                                          unitProduct
                                                                              .setDescriptionEdit(val),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10.0),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              TextButton(
                                                                            style:
                                                                                buttonCancel,
                                                                            onPressed:
                                                                                () async {
                                                                              await unitProduct.deleteSelectedUnitProductEdit(productProvider.editProductId, unit.unitsList[index].id);
                                                                              unitProduct.isUnitCheckedListEdit(unit.unitsList[index].id!, productProvider.editProductId!, index);
                                                                              unitProduct.getAllUnitsProductEdit();

                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Center(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(4.0),
                                                                                child: Text('إلغاء اختيار'),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.05,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              TextButton(
                                                                            style:
                                                                                buttonSubmit,
                                                                            onPressed:
                                                                                () async {
                                                                              if (!_editunitProductDscKey.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                              _editunitProductDscKey.currentState!.save();

                                                                              if (unitProduct.isUnitCheckedStateList[index]) {
                                                                                await unitProduct.updateSelectedUnitProduct(productProvider.editProductId, unit.unitsList[index].id);
                                                                              } else {
                                                                                await unitProduct.addSelectedUnitProductEdit(productProvider.editProductId, unit.unitsList[index].id);
                                                                              }

                                                                              unitProduct.isUnitCheckedListEdit(unit.unitsList[index].id!, productProvider.editProductId!, index);
                                                                              unitProduct.getAllUnitsProductEdit();

                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Center(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(4.0),
                                                                                child: Text('موافق'),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 250,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: unitProduct
                                                            .isUnitCheckedStateListEdit[
                                                        index]
                                                    ? buttonSelectedColorRegular
                                                    : bgColorRegular,
                                                border: Border.all(
                                                  color: unitProduct
                                                              .isUnitCheckedStateListEdit[
                                                          index]
                                                      ? buttonSelectedColorRegular
                                                      : buttonColorRegular,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: FittedBox(
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Text(
                                                      '${unit.unitsList[index].unitTitle}',
                                                      style: unitProduct
                                                                  .isUnitCheckedStateListEdit[
                                                              index]
                                                          ? buttonHomeText
                                                          : imageButtonText,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              minLines: 6,
                              maxLines: 6,
                              decoration: textInputDecoration.copyWith(
                                labelText: 'ملاحظات',
                              ),
                              controller: _productDescriptionController,
                              onChanged: (val) =>
                                  productProvider.setDescriptionEdit(val),
                              onSaved: (val) =>
                                  productProvider.setDescriptionEdit(val),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: buttonCancel,
                                    onPressed: () async {
                                      productProvider.clearDataEdit();
                                      unitProduct.getAllUnitsProductEdit();

                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductsList(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('إلغاء'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Expanded(
                                  child: TextButton(
                                    style: buttonSubmit,
                                    onPressed: () async {
                                      if (!_editUnitProductKey.currentState!
                                          .validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'يجب ملء جميع الحقول السابقة'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );

                                        return;
                                      }
                                      _editUnitProductKey.currentState!.save();

                                      await productProvider.updateProduct();
                                      await unitProduct.getAllUnitsProduct();
                                      await unitProduct
                                          .getAllUnitsProductEdit();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('تم تعديل مستند بنجاح'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductsList(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('تعديل'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
