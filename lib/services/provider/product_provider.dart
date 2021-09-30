// Eng Mouaz M. Al-Shahmeh
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sells_app/common/theme.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sells_app/repositories/orm_config.dart';

class ProductProvider extends ChangeNotifier {
  static const _dateTimeString = '2020-07-17T03:18:31.177769-04:00';
  DateTime? _dateTime =
      DateTime.parse(_dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
  DateTime? get dateTime => _dateTime;
  // .........................................
  /// add product attributes
  // .........................................
  // image picker code
  // .........................................
  Future<XFile?>? _image;
  File? _imagef;
  final ImagePicker _picker = ImagePicker();
  pickImageFromGallery(ImageSource source) async {
    _image = _picker.pickImage(
      source: source,
      imageQuality: 30,
    );
    String pathF = await _image!.then((value) => value!.path);
    setImageUrl(pathF);
    _imagef = File(pathF);
    notifyListeners();
  }

  Widget imageFromGallery() {
    return FutureBuilder<XFile?>(
      future: _image,
      builder: (BuildContext context, AsyncSnapshot<XFile?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          return Image.file(File(snapshot.data!.path));
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  dynamic _pickImageError;
  String? _retrieveDataError;
  bool _kIsWeb = false;
  dynamic get pickImageError => _pickImageError;
  String? get retrieveDataError => _retrieveDataError;
  void onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    pickImageFromGallery(source);
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imagef != null) {
      return Container(
        width: 250,
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                width: 250,
                child: _kIsWeb
                    ? FittedBox(child: Image.network(_imagef!.path))
                    : FittedBox(child: Image.file(File(_imagef!.path)))),
            _imagef != null
                ? InkWell(
                    onTap: () {
                      _imagef = null;
                      notifyListeners();
                    },
                    child: Icon(
                      Icons.delete,
                      color: danger,
                      size: 80,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 50,
                      ),
                    ],
                  ),
          ],
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'خطأ التقاط الصورة: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            size: 40,
          ),
        ],
      );
    }
  }

  Widget handlePreview() {
    return _previewImages();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  // .........................................
  // end image picker code
  // .........................................
  int? _catId;
  int? get catId => _catId;
  setCatId(int? val) {
    _catId = val;
    notifyListeners();
  }

  String? _imageUrl;
  String? get imageUrl => _imageUrl;
  setImageUrl(String? val) {
    _imageUrl = val;
    notifyListeners();
  }

  String? _productName;
  String? get productName => _productName;
  setProductName(String? val) {
    _productName = val;
    notifyListeners();
  }

  String? _productNum;
  String? get productNum => _productNum;
  setProductNum(String? val) {
    _productNum = val;
    notifyListeners();
  }

  String? _description;
  String? get description => _description;
  setDescription(String? val) {
    _description = val;
    notifyListeners();
  }

  clearData() {
    _image = null;
    _imagef = null;
    _imageUrl = null;
    _productName = null;
    _productNum = null;
    _description = null;
    _catId = 0;
  }

  // .........................................
  /// add product attributes end
  // .........................................
  /// get products list
  // .........................................
  static int? _listProductsCount = 0;
  int? get listProductsCount => _listProductsCount;
  List<Product> _productList = [];
  List<Product> get productList => _productList;
  getAllProducts() async {
    _productList = await Product().select().toList();
    _listProductsCount = _productList.length;
    notifyListeners();
  }

  List<bool> _isOpenListRecord = List.filled(100, false);
  List<bool> get isOpenListRecord => _isOpenListRecord;
  setIsOpenListRecord(int index) {
    _isOpenListRecord[index] = !_isOpenListRecord[index];
    for (var i = 0; i < _isOpenListRecord.length; i++) {
      if (i != index) {
        _isOpenListRecord[i] = false;
      }
    }
    notifyListeners();
  }

  closeAllListRecord() {
    for (var i = 0; i < _isOpenListRecord.length; i++) {
      _isOpenListRecord[i] = false;
    }
    notifyListeners();
  }

  // .........................................
  /// get products list end
  // .........................................
  /// search and filter products
  // .........................................
  String? _keySearch = '';
  String? get keySearch => _keySearch;
  setKeySearch(String? val) {
    _keySearch = val;
    notifyListeners();
  }

  searchProductsByKey() async {
    _productList =
        await Product().select().productName.contains(_keySearch).toList();
    _listProductsCount = _productList.length;
    notifyListeners();
  }

  filterProductsByCategory(int? category) async {
    _productList = await Product().select().catId.equals(category).toList();
    _listProductsCount = _productList.length;
    notifyListeners();
  }

  String? _scanResult;
  String? get scanResult => _scanResult;
  Future searchProductsByScanBarcode() async {
    try {
      _scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'الغاء',
        true,
        ScanMode.BARCODE,
      );
      if (_scanResult != '-1') {
        setKeySearch(_scanResult);
        searchScan();
      } else {
        getAllProducts();
      }
    } on PlatformException {
      _scanResult = null;
    }
  }

  searchScan() async {
    _productList =
        await Product().select().productName.contains(_scanResult).toList();
    _listProductsCount = _productList.length;
    notifyListeners();
  }

  // .........................................
  /// search and filter products end
  // .........................................
  /// edit product
  // .........................................
  Product? _selectedProductEdit;
  Product? get selectedProductEdit => _selectedProductEdit;
  getProductSelected() async {
    _selectedProductEdit = await Product().getById(_editProductId);
    setCatIdEdit(int.tryParse('${_selectedProductEdit!.catId}'));
    setImageUrlEdit(_selectedProductEdit!.imageUrl);
    setProductNameEdit(_selectedProductEdit!.productName);
    setProductNumEdit(_selectedProductEdit!.productNum.toString());
    setDescriptionEdit(_selectedProductEdit!.description);
    notifyListeners();
  }

  int? _editProductId = 0;
  int? get editProductId => _editProductId;
  setEditProductId(int val) {
    _editProductId = val;
    getProductSelected();
    notifyListeners();
  }

  // .........................................
  /// edit product attributes
  // .........................................
  // image picker code
  // .........................................
  Future<XFile?>? _imageEdit;
  File? _imagefEdit;
  final ImagePicker _pickerEdit = ImagePicker();
  pickImageFromGalleryEdit(ImageSource source) async {
    _imageEdit = _pickerEdit.pickImage(
      source: source,
      imageQuality: 30,
    );
    String pathFEdit = await _imageEdit!.then((value) => value!.path);
    setImageUrlEdit(pathFEdit);
    _imagefEdit = File(pathFEdit);
    notifyListeners();
  }

  Widget imageFromGalleryEdit() {
    return FutureBuilder<XFile?>(
      future: _imageEdit,
      builder: (BuildContext context, AsyncSnapshot<XFile?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          return Image.file(File(snapshot.data!.path));
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  dynamic _pickImageErrorEdit;
  String? _retrieveDataErrorEdit;
  bool _kIsWebEdit = false;
  dynamic get pickImageErrorEdit => _pickImageErrorEdit;
  String? get retrieveDataErrorEdit => _retrieveDataErrorEdit;
  void onImageButtonPressedEdit(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    pickImageFromGalleryEdit(source);
  }

  Widget _previewImagesEdit() {
    final Text? retrieveErrorEdit = _getRetrieveErrorWidgetEdit();
    if (retrieveErrorEdit != null) {
      return retrieveErrorEdit;
    }
    if (_imagefEdit != null) {
      return Container(
        width: 150,
        height: 150,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: 150,
              height: 150,
              child: _kIsWebEdit
                  ? FittedBox(
                      child: Image.network(_imagefEdit!.path),
                    )
                  : FittedBox(
                      child: Image.file(File(_imagefEdit!.path)),
                    ),
            ),
            _imagefEdit != null
                ? InkWell(
                    onTap: () {
                      _imagefEdit = null;
                      notifyListeners();
                    },
                    child: Icon(
                      Icons.delete,
                      color: danger,
                      size: 40,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 50,
                      ),
                    ],
                  ),
          ],
        ),
      );
    } else if (_pickImageErrorEdit != null) {
      return Text(
        'خطأ التقاط الصورة: $_pickImageErrorEdit',
        textAlign: TextAlign.center,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            size: 50,
          ),
        ],
      );
    }
  }

  Widget handlePreviewEdit() {
    return _previewImagesEdit();
  }

  Future<void> retrieveLostDataEdit() async {
    final LostDataResponse responseEdit = await _pickerEdit.retrieveLostData();
    if (responseEdit.isEmpty) {
      return;
    }
  }

  Text? _getRetrieveErrorWidgetEdit() {
    if (_retrieveDataErrorEdit != null) {
      final Text resultEdit = Text(_retrieveDataErrorEdit!);
      _retrieveDataErrorEdit = null;
      return resultEdit;
    }
    return null;
  }

  // .........................................
  // end image picker code
  // .........................................
  int? _catIdEdit;
  int? get catIdEdit => _catIdEdit;
  setCatIdEdit(int? val) {
    _catIdEdit = val;
    notifyListeners();
  }

  String? _imageUrlEdit;
  String? get imageUrlEdit => _imageUrlEdit;
  setImageUrlEdit(String? val) {
    if (val != null) _imagefEdit = File(val);
    _imageUrlEdit = val;
    notifyListeners();
  }

  String? _productNameEdit;
  String? get productNameEdit => _productNameEdit;
  setProductNameEdit(String? val) {
    _productNameEdit = val;
    notifyListeners();
  }

  String? _productNumEdit;
  String? get productNumEdit => _productNumEdit;
  setProductNumEdit(String? val) {
    _productNumEdit = val;
    notifyListeners();
  }

  String? _descriptionEdit;
  String? get descriptionEdit => _descriptionEdit;
  setDescriptionEdit(String? val) {
    _descriptionEdit = val;
    notifyListeners();
  }

  // .........................................
  /// edit product attributes end
  // .........................................
  /// edit product end
  // .........................................
  deleteProduct(index) async {
    await Product().select().id.equals(_productList[index].id).delete();
    getAllProducts();
    notifyListeners();
  }

  addProduct() async {
    await Product(
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      productName: _productName,
      productNum: int.tryParse('$_productNum'),
      imageUrl: _imageUrl,
      catId: _catId.toString(),
      description: _description,
    ).save();
    getAllProducts();
    notifyListeners();
  }

  updateProduct() async {
    await Product(
      id: _editProductId,
      createdDate: _dateTime,
      lastModifiedDate: _dateTime,
      createdDateInLocal: _dateTime,
      productName: _productName,
      productNum: int.tryParse('$_productNum'),
      imageUrl: _imageUrl,
      catId: _catId.toString(),
      description: _description,
    ).save();
    getAllProducts();
    notifyListeners();
  }

  clearDataEdit() {
    _imageEdit = null;
    _imagefEdit = null;
    _imageUrlEdit = null;
    _productNameEdit = null;
    _productNumEdit = null;
    _descriptionEdit = null;
    _catIdEdit = 0;
  }
}
