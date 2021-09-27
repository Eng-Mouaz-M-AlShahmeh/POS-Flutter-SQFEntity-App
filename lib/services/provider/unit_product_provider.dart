// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/repositories/orm_config.dart';

class UnitProductProvider extends ChangeNotifier {
  static const _dateTimeString = '2020-07-17T03:18:31.177769-04:00';
  DateTime? _dateTime =
      DateTime.parse(_dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
  DateTime? get dateTime => _dateTime;

  int? _productIdInvoice = 0;
  int? get productIdInvoice => _productIdInvoice;
  setProductIdInvoice(int val) {
    _productIdInvoice = val;
    notifyListeners();
  }

  String? _sellPrice = '';
  String? get sellPrice => _sellPrice;
  setSellPrice(String? val) {
    _sellPrice = val;
    notifyListeners();
  }

  String? _buyPrice = '';
  String? get buyPrice => _buyPrice;
  setBuyPrice(String? val) {
    _buyPrice = val;
    notifyListeners();
  }

  String? _barcode = '';
  String? get barcode => _barcode;
  setBarcode(String? val) {
    _barcode = val;
    notifyListeners();
  }

  String? _quantity = '';
  String? get quantity => _quantity;
  setQuantity(String? val) {
    _quantity = val;
    notifyListeners();
  }

  String? _description = '';
  String? get description => _description;
  setDescription(String? val) {
    _description = val;
    notifyListeners();
  }

  String? _unitId = '';
  String? get unitId => _unitId;
  setUnitId(String? val) {
    _unitId = val;
    notifyListeners();
  }

  String? _productId = '';
  String? get productId => _productId;
  setProductId(String? val) {
    _productId = val;
    notifyListeners();
  }

  List<UnitsProduct> _unitsProductList = [];
  List<UnitsProduct> get unitsProductList => _unitsProductList;
  getAllUnitsProduct() async {
    _unitsProductList = await UnitsProduct().select().toList();
    notifyListeners();
  }

  UnitsProduct? _selectedUnitProduct;
  UnitsProduct? get selectedUnitProduct => _selectedUnitProduct;
  getUnitsProductListByProductId(unitProductId) async {
    _selectedUnitProduct = await UnitsProduct().getById(unitProductId);
    notifyListeners();
  }

  static int? _unitCheckedStateListCount = 0;
  int? get unitCheckedStateListCount => _unitCheckedStateListCount;
  List<bool> _isUnitCheckedStateList = List.filled(100, false);
  List<bool> get isUnitCheckedStateList => _isUnitCheckedStateList;
  void isUnitCheckedList(int unitId, int productId, int unitIndex) {
    _isUnitCheckedStateList[unitIndex] = false;
    if (_unitsProductList.isNotEmpty) {
      _unitsProductList.forEach((row) {
        if (row.unitId == unitId && row.productId == productId) {
          _isUnitCheckedStateList[unitIndex] = !_isUnitCheckedStateList[unitIndex];
          notifyListeners();
        } else {
          _isUnitCheckedStateList[unitIndex] = false;
          notifyListeners();
        }
      });
    }
  }
  // ........................................
  /// buy invoice description item
  // ........................................
  List<UnitsProduct> _productSelectedUnitsList = [];
  List<UnitsProduct> get productSelectedUnitsList => _productSelectedUnitsList;
  getSelectedUnitsProduct(productId) async {
    _productSelectedUnitsList =
        await UnitsProduct().select().productId.equals(productId).toList();
    notifyListeners();
  }

  List<UnitsProduct> _allUnitsProductList = [];
  List<UnitsProduct> get allUnitsProductList => _allUnitsProductList;
  getAllUnitsProductList() async {
    _allUnitsProductList =
    await UnitsProduct().select().toList();
    notifyListeners();
  }

  // ........................................
  /// buy invoice description item end
  // ........................................
  /// edit unit product
  // ........................................
  String? _sellPriceEdit = '';
  String? get sellPriceEdit => _sellPriceEdit;
  setSellPriceEdit(String? val) {
    _sellPriceEdit = val;
    notifyListeners();
  }

  String? _buyPriceEdit = '';
  String? get buyPriceEdit => _buyPriceEdit;
  setBuyPriceEdit(String? val) {
    _buyPriceEdit = val;
    notifyListeners();
  }

  String? _barcodeEdit = '';
  String? get barcodeEdit => _barcodeEdit;
  setBarcodeEdit(String? val) {
    _barcodeEdit = val;
    notifyListeners();
  }

  String? _quantityEdit = '';
  String? get quantityEdit => _quantityEdit;
  setQuantityEdit(String? val) {
    _quantityEdit = val;
    notifyListeners();
  }

  String? _descriptionEdit = '';
  String? get descriptionEdit => _descriptionEdit;
  setDescriptionEdit(String? val) {
    _descriptionEdit = val;
    notifyListeners();
  }

  int? _unitIdEdit = 0;
  int? get unitIdEdit => _unitIdEdit;
  setUnitIdEdit(int? val) {
    _unitIdEdit = val;
    notifyListeners();
  }

  int? _unitProductIdEdit = 0;
  int? get unitProductIdEdit => _unitProductIdEdit;
  setUnitProductIdEdit(int? val) {
    _unitProductIdEdit = val;
    notifyListeners();
  }

  List<UnitsProduct> _unitsProductListEdit = [];
  List<UnitsProduct> get unitsProductListEdit => _unitsProductListEdit;
  getAllUnitsProductEdit() async {
    _unitsProductListEdit = await UnitsProduct().select().toList();
    notifyListeners();
  }

  List<UnitsProduct> _unitsProductListEditPU = [];
  List<UnitsProduct> get unitsProductListEditPU => _unitsProductListEditPU;
  setSelectedUnitProductEdit(productId, unitId) async {
    _unitsProductListEditPU = await UnitsProduct().select().startBlock.productId.equals(productId).and.unitId.equals(unitId).endBlock.toList();
    setUnitProductIdEdit(int.tryParse('${_unitsProductListEditPU[0].id}'));
    setSellPriceEdit(_unitsProductListEditPU[0].sellPrice);
    setBuyPriceEdit(_unitsProductListEditPU[0].buyPrice);
    setBarcodeEdit(_unitsProductListEditPU[0].barcode);
    setQuantityEdit(_unitsProductListEditPU[0].quantity);
    setDescriptionEdit(_unitsProductListEditPU[0].description);
    notifyListeners();
  }

  static int? _unitCheckedStateListCountEdit = 0;
  int? get unitCheckedStateListCountEdit => _unitCheckedStateListCountEdit;
  List<bool> _isUnitCheckedStateListEdit = List.filled(100, false);
  List<bool> get isUnitCheckedStateListEdit => _isUnitCheckedStateListEdit;
  void isUnitCheckedListEdit(int unitId, int productId, int unitIndex) {
    _isUnitCheckedStateListEdit[unitIndex] = false;
    if (_unitsProductListEdit.isNotEmpty) {
      _unitsProductListEdit.forEach((row) {
        if (row.unitId == unitId && row.productId == productId) {
          _isUnitCheckedStateListEdit[unitIndex] = !_isUnitCheckedStateListEdit[unitIndex];
        } else {
          _isUnitCheckedStateListEdit[unitIndex] = false;
        }
      });
    }
    notifyListeners();
  }
  // ........................................
  // edit unit product end
  // ........................................
  deleteUnitsProduct(productId) async {
    await UnitsProduct().select().productId.equals(productId).delete();
    getAllUnitsProduct();
    notifyListeners();
  }

  List<Product> _lastUnitProduct = [];
  List<Product> get lastUnitProduct => _lastUnitProduct;
  int? _lastUnitProductIdPlusOne = 1;
  int? get lastUnitProductIdPlusOne => _lastUnitProductIdPlusOne;
  getLastRowInsertedIDPlusOne() async {
    _lastUnitProduct = await Product().select().orderByDesc('id').top(1).toList();
    _lastUnitProductIdPlusOne = _lastUnitProduct.isNotEmpty? _lastUnitProduct[0].id! + 1 : 1;
    notifyListeners();
  }

  deleteSelectedUnitProduct(productId, unitId) async {
    await UnitsProduct().select().startBlock.productId.equals(productId).unitId.equals(unitId).endBlock.delete();
    getAllUnitsProduct();
    notifyListeners();
  }

  deleteSelectedUnitProductEdit(productId, unitId) async {
    await UnitsProduct().select().startBlock.productId.equals(productId).unitId.equals(unitId).endBlock.delete();
    getAllUnitsProductEdit();
    notifyListeners();
  }

  addSelectedUnitProduct(productId, unitId) async {
    await UnitsProduct(
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      barcode: _barcode,
      quantity: _quantity,
      sellPrice: _sellPrice,
      buyPrice: _buyPrice,
      description: _description,
      unitId: unitId,
      productId: productId,
    ).save();
    getAllUnitsProduct();
    notifyListeners();
  }

  addSelectedUnitProductEdit(productId, unitId) async {
    await UnitsProduct(
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      barcode: _barcode,
      quantity: _quantity,
      sellPrice: _sellPrice,
      buyPrice: _buyPrice,
      description: _description,
      unitId: unitId,
      productId: productId,
    ).save();
    getAllUnitsProductEdit();
    notifyListeners();
  }

  updateSelectedUnitProduct(productId, unitId) async {
    await UnitsProduct(
      id: _unitProductIdEdit,
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      barcode: _barcode,
      quantity: _quantity,
      sellPrice: _sellPrice,
      buyPrice: _buyPrice,
      description: _description,
      unitId: unitId,
      productId: productId,
    ).save();
    getAllUnitsProductEdit();
    notifyListeners();
  }

  clearCache() {
    setSellPrice('');
    setBuyPrice('');
    setBarcode('');
    setQuantity('');
    setDescription('');
  }


}
