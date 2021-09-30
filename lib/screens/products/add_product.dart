// Eng Mouaz M. Al-Shahmeh
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
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';
import 'package:sells_app/services/provider/unit_provider.dart';
import 'package:barcode_widget/barcode_widget.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);

  final GlobalKey<FormState> _unitProductDscKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addUnitProductKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var productProvider = context.watch<ProductProvider>();
    var unitProduct = context.watch<UnitProductProvider>();
    var category = context.watch<CategoryProvider>();
    var unit = context.read<UnitProvider>();
    final orientation = MediaQuery.of(context).orientation;

    final TextEditingController _barcodeController =
        TextEditingController(text: unitProduct.barcode);
    _barcodeController.value = _barcodeController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.barcode!.length),
      ),
    );

    final TextEditingController _quantityController =
        TextEditingController(text: unitProduct.quantity);
    _quantityController.value = _quantityController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.quantity!.length),
      ),
    );

    final TextEditingController _sellPriceController =
        TextEditingController(text: unitProduct.sellPrice);
    _sellPriceController.value = _sellPriceController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.sellPrice!.length),
      ),
    );

    final TextEditingController _buyPriceController =
        TextEditingController(text: unitProduct.buyPrice);
    _buyPriceController.value = _buyPriceController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.buyPrice!.length),
      ),
    );

    final TextEditingController _descriptionController =
        TextEditingController(text: unitProduct.description);
    _descriptionController.value = _descriptionController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: unitProduct.description!.length),
      ),
    );

    return WillPopScope(
      onWillPop: () async => await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProductsList()),
        (route) => false,
      ),
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Form(
                  key: _addUnitProductKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${AppLocalizations.of(context).translate('add_new_product')!}',
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
                                    width: 200,
                                    height: 200,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: TextButton(
                                        style: buttonForm,
                                        onPressed: () {
                                          productProvider.onImageButtonPressed(
                                            ImageSource.gallery,
                                          );
                                        },
                                        child: Consumer<ProductProvider>(
                                          builder: (context, picked, child) =>
                                              defaultTargetPlatform ==
                                                      TargetPlatform.android
                                                  ? FutureBuilder<void>(
                                                      future: picked
                                                          .retrieveLostData(),
                                                      builder: (BuildContext
                                                              context,
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
                                                            return picked
                                                                .handlePreview();
                                                          default:
                                                            if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                '${AppLocalizations.of(context).translate('error_picking_image')!}: ${snapshot.error}}',
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
                                                  : picked.handlePreview(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  labelText:
                                      '${AppLocalizations.of(context).translate('product_name')!}',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return requieredFeild;
                                  }
                                  return null;
                                },
                                onSaved: (val) =>
                                    productProvider.setProductName(val),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  labelText:
                                      '${AppLocalizations.of(context).translate('product_number')!}',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return requieredFeild;
                                  }
                                  return null;
                                },
                                onSaved: (val) =>
                                    productProvider.setProductNum(val),
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
                                          '${AppLocalizations.of(context).translate('choose_category')!}',
                                          style: appTheme.textTheme.headline5,
                                        ),
                                        value: productProvider.catId,
                                        items: <DropdownMenuItem<int>>[
                                              DropdownMenuItem<int>(
                                                value: 0,
                                                child: Text(
                                                  '${AppLocalizations.of(context).translate('nothing')!}',
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
                                            productProvider.setCatId(val),
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
                                            '${AppLocalizations.of(context).translate('choose_units_for_product')!}',
                                            style: appTheme.textTheme.headline5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 15, 15),
                                            child: TextButton(
                                              onPressed: () {
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
                                                                    Icons
                                                                        .cancel,
                                                                    color: appTheme
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    '${AppLocalizations.of(context).translate('add_unit_details_for_product')!}',
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
                                                                          .all(
                                                                      15.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Form(
                                                                  key:
                                                                      _unitProductDscKey,
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
                                                                            appTheme.primaryColor,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              BarcodeWidget(
                                                                            barcode:
                                                                                Barcode.code128(),
                                                                            data:
                                                                                unitProduct.barcode!,
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
                                                                            textInputDecoration.copyWith(
                                                                          labelText:
                                                                              '${AppLocalizations.of(context).translate('barcode')!}',
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
                                                                                unitProduct.setBarcode(val),
                                                                        onSaved:
                                                                            (val) =>
                                                                                unitProduct.setBarcode(val),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10.0),
                                                                      TextFormField(
                                                                        decoration:
                                                                            textInputDecoration.copyWith(
                                                                          labelText:
                                                                              '${AppLocalizations.of(context).translate('quantity')!}',
                                                                        ),
                                                                        keyboardType:
                                                                            TextInputType.number,
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
                                                                        onSaved:
                                                                            (val) =>
                                                                                unitProduct.setQuantity(val),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10.0),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                TextFormField(
                                                                              decoration: textInputDecoration.copyWith(
                                                                                labelText: '${AppLocalizations.of(context).translate('buy_price')!}',
                                                                              ),
                                                                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                                              controller: _buyPriceController,
                                                                              validator: (String? value) {
                                                                                if (value!.isEmpty) {
                                                                                  return requieredFeild;
                                                                                }
                                                                                return null;
                                                                              },
                                                                              onSaved: (val) => unitProduct.setBuyPrice(val),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: 10.0),
                                                                          Expanded(
                                                                            child:
                                                                                TextFormField(
                                                                              decoration: textInputDecoration.copyWith(
                                                                                labelText: '${AppLocalizations.of(context).translate('sell_price')!}',
                                                                              ),
                                                                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                                              controller: _sellPriceController,
                                                                              validator: (String? value) {
                                                                                if (value!.isEmpty) {
                                                                                  return requieredFeild;
                                                                                }
                                                                                return null;
                                                                              },
                                                                              onSaved: (val) => unitProduct.setSellPrice(val),
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
                                                                            textInputDecoration.copyWith(
                                                                          labelText:
                                                                              '${AppLocalizations.of(context).translate('notes')!}',
                                                                        ),
                                                                        controller:
                                                                            _descriptionController,
                                                                        onSaved:
                                                                            (val) =>
                                                                                unitProduct.setDescription(val),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10.0),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                TextButton(
                                                                              style: buttonCancel,
                                                                              onPressed: () async {
                                                                                await unitProduct.getLastRowInsertedIDPlusOne();
                                                                                await unitProduct.deleteSelectedUnitProduct(unitProduct.lastUnitProduct.isNotEmpty ? unitProduct.lastUnitProduct[0].id : 1, unit.unitsList[index].id);
                                                                                unitProduct.clearCache();

                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: Text('${AppLocalizations.of(context).translate('cancel_choose')!}'),
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
                                                                              style: buttonSubmit,
                                                                              onPressed: () async {
                                                                                if (!_unitProductDscKey.currentState!.validate()) {
                                                                                  return;
                                                                                }
                                                                                _unitProductDscKey.currentState!.save();

                                                                                await unitProduct.getLastRowInsertedIDPlusOne();
                                                                                await unitProduct.deleteSelectedUnitProduct(unitProduct.lastUnitProduct.isNotEmpty ? unitProduct.lastUnitProduct[0].id : 1, unit.unitsList[index].id);
                                                                                await unitProduct.addSelectedUnitProduct(unitProduct.lastUnitProductIdPlusOne, unit.unitsList[index].id);
                                                                                unitProduct.isUnitCheckedList(unit.unitsList[index].id!, unitProduct.lastUnitProductIdPlusOne!, index);

                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: Text('${AppLocalizations.of(context).translate('accept')!}'),
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
                                                              .isUnitCheckedStateList[
                                                          index]
                                                      ? buttonSelectedColorRegular
                                                      : bgColorRegular,
                                                  border: Border.all(
                                                    color: unitProduct
                                                                .isUnitCheckedStateList[
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
                                                                    .isUnitCheckedStateList[
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
                                  labelText:
                                      '${AppLocalizations.of(context).translate('notes')!}',
                                ),
                                onSaved: (val) =>
                                    productProvider.setDescription(val),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: buttonCancel,
                                      onPressed: () async {
                                        productProvider.clearData();
                                        await unitProduct
                                            .getAllUnitsProductList();

                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductsList(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                              '${AppLocalizations.of(context).translate('cancel')!}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      style: buttonSubmit,
                                      onPressed: () async {
                                        if (!_addUnitProductKey.currentState!
                                            .validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  '${AppLocalizations.of(context).translate('should_all_previous_fields_be_filled')!}'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }
                                        _addUnitProductKey.currentState!.save();

                                        await productProvider.addProduct();
                                        await productProvider.clearData();
                                        await unitProduct
                                            .getAllUnitsProductList();

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${AppLocalizations.of(context).translate('record_sent_successfully')!}'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductsList(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                              '${AppLocalizations.of(context).translate('send')!}'),
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
      ),
    );
  }
}
