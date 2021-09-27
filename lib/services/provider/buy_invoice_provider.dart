// Eng Mouaz M. Al-Shahmeh
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/repositories/orm_config.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';

class BuyInvoiceProvider extends ChangeNotifier {
  static const _dateTimeString = '2020-07-17T03:18:31.177769-04:00';
  DateTime? _dateTime = DateTime.parse(_dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
  DateTime? get dateTime => _dateTime;

  List<bool> _showUnitsList = List.filled(100, true);
  List<bool> get showUnitsList => _showUnitsList;
  void isShowUnitsList(int index) {
    _showUnitsList[index] = !_showUnitsList[index];
    notifyListeners();
  }

  int? _userId = 0;
  int? get userId => _userId;
  setUserId(int? val) {
    _userId = val;
    notifyListeners();
  }

  double _totalBeforeDiscount = 0.0;
  double get totalBeforeDiscount => _totalBeforeDiscount;
  setTotalBeforeDiscount(double val) {
    _totalBeforeDiscount = val;
    setTotalAfterDiscount();
    setTotalAfterVAT();
    notifyListeners();
  }

  double _discountFixedAmount = 0.0;
  double get discountFixedAmount => _discountFixedAmount;
  setDiscountFixedAmount(double val) {
    _discountFixedAmount = val;
    notifyListeners();
  }

  int _discountPercentage = 0;
  int get discountPercentage => _discountPercentage;
  setDiscountPercentage(int val) {
    _discountPercentage = val;
    notifyListeners();
  }

  double _totalAfterDiscount = 0.0;
  double get totalAfterDiscount => _totalAfterDiscount;
  setTotalAfterDiscount() {
    _totalAfterDiscount = _totalBeforeDiscount - _discountFixedAmount;
    notifyListeners();
  }

  int _vat = 15;
  int get vat => _vat;
  setVAT(int val) {
    _vat = val;
    notifyListeners();
  }

  double _totalAfterVAT = 0.0;
  double get totalAfterVAT => _totalAfterVAT;
  setTotalAfterVAT() {
    setVatValue((_vat * _totalAfterDiscount) / 100.0);
    _totalAfterVAT = _totalAfterDiscount + (_vat * _totalAfterDiscount) / 100.0;
    notifyListeners();
  }

  double _vatValue = 0.0;
  double get vatValue => _vatValue;
  setVatValue(val) {
    _vatValue = val;
    notifyListeners();
  }

  List<InvoiceDetail> _invoiceDetailsList = [];
  List<InvoiceDetail> get invoiceDetailsList => _invoiceDetailsList;
  getInvoiceDetailsList(BuildContext context) async {
    _invoiceDetailsList = await InvoiceDetail().select().invoiceId.equals(1).toList();
    sumTotal(context);
    setTotalBeforeDiscount(_total);
    notifyListeners();
  }

  double _total = 0.0;
  double get total => _total;
  sumTotal(BuildContext context) {
    var unitProduct = context.read<UnitProductProvider>();
    _total = 0.0;
    if (_invoiceDetailsList.isNotEmpty) {
      for (int i = 0; i < _invoiceDetailsList.length; i++) {
        _total = _total +
            (double.tryParse("${_invoiceDetailsList[i].quantity!}")! *
                num.tryParse(
                    "${unitProduct.unitsProductList[int.tryParse('${_invoiceDetailsList[i].unitProductId!}')! - 1].buyPrice}")!);
      }
      notifyListeners();
    }
  }

  int? _unitProductIdInvoiceDsc = 0;
  int? get unitProductIdInvoiceDsc => _unitProductIdInvoiceDsc;
  setUnitProductIdInvoice(int val) {
    _unitProductIdInvoiceDsc = val;
    notifyListeners();
  }

  bool _isExistedInvoice = false;
  bool get isExistedInvoice => _isExistedInvoice;
  bool _isInvoiceVirtual = false;
  bool get isInvoiceVirtual => _isInvoiceVirtual;

  int? _invoiceDscRecordId = 0;
  int? get invoiceDscRecordId => _invoiceDscRecordId;

  increaseUnitProductInInvoiceList(
      BuildContext context,
      InvoiceDetail invoiceDetails,
      int unitProductId,
      int quantity) async {
    _isExistedInvoice = false;
    _isInvoiceVirtual = false;
    if (_invoiceDetailsList.isNotEmpty) {
      for (int i = 0; i < _invoiceDetailsList.length; i++) {
        if (_invoiceDetailsList[i].unitProductId == '$unitProductId' &&
            _invoiceDetailsList[i].invoiceId == '1') {
          _isExistedInvoice = true;
          _isInvoiceVirtual = true;
          _invoiceDscRecordId = _invoiceDetailsList[i].id;
        } else if (_invoiceDetailsList[i].unitProductId == '$unitProductId' &&
            _invoiceDetailsList[i].invoiceId != '1') {
          _isExistedInvoice = true;
        }
      }
    }
    if (_isExistedInvoice == false) {
      await InvoiceDetail(
          createdDate: _dateTime,
          lastModifiedDate: _dateTime,
          createdDateInLocal: _dateTime,
          invoiceId: '1',
          unitProductId: invoiceDetails.unitProductId,
          quantity: invoiceDetails.quantity,
      ).save();

    } else if (_isExistedInvoice == true && _isInvoiceVirtual == false) {
      await InvoiceDetail(
          createdDate: _dateTime,
          lastModifiedDate: _dateTime,
          createdDateInLocal: _dateTime,
          invoiceId: '1',
          unitProductId: invoiceDetails.unitProductId,
          quantity: invoiceDetails.quantity,
      ).save();

    } else if (_isExistedInvoice == true && _isInvoiceVirtual == true) {
      await InvoiceDetail(
          id: _invoiceDscRecordId,
          createdDate: _dateTime,
          lastModifiedDate: _dateTime,
          createdDateInLocal: _dateTime,
          invoiceId: '1',
          unitProductId: invoiceDetails.unitProductId,
          quantity: quantity.toString(),
      ).save();

    }

    getInvoiceDetailsList(context);
  }

  decreaseUnitProductInInvoiceList(
      BuildContext context, int unitProductId, int quantity) async {
    _isExistedInvoice = false;
    if (_invoiceDetailsList.isNotEmpty) {
      for (int i = 0; i < _invoiceDetailsList.length; i++) {
        if (_invoiceDetailsList[i].unitProductId == '$unitProductId') {
          _isExistedInvoice = true;
          _invoiceDscRecordId = _invoiceDetailsList[i].id;
        }
      }
    }
    if (_isExistedInvoice == false) { } else {
      if (quantity != 0) {
        await InvoiceDetail(
            id: _invoiceDscRecordId,
            createdDate: _dateTime,
            lastModifiedDate: _dateTime,
            createdDateInLocal: _dateTime,
            invoiceId: '1',
            unitProductId: unitProductId.toString(),
            quantity: quantity.toString()
        ).save();
      } else {
        await InvoiceDetail().select().id.equals(_invoiceDscRecordId).delete();
      }
    }
    getInvoiceDetailsList(context);
  }

  int? _quantityInput = 0;
  int? get quantityInput => _quantityInput;
  setQuantityInput(int val) {
    _quantityInput = val;
    notifyListeners();
  }

  updateUnitProductInInvoiceListQuantity(
      BuildContext context,
      InvoiceDetail invoiceDetails,
      int unitProductId,
      int quantity) async {
    _isExistedInvoice = false;
    if (_invoiceDetailsList.isNotEmpty) {
      for (int i = 0; i < _invoiceDetailsList.length; i++) {
        if (_invoiceDetailsList[i].unitProductId == '$unitProductId') {
          _isExistedInvoice = true;
          _invoiceDscRecordId = _invoiceDetailsList[i].id;
        }
      }
    }
    if (_isExistedInvoice == false) {
      await InvoiceDetail(
          createdDate: _dateTime,
          lastModifiedDate: _dateTime,
          createdDateInLocal: _dateTime,
          invoiceId: '1',
          unitProductId: unitProductId.toString(),
          quantity: quantity.toString()
      ).save();

    } else {
      if (quantity != 0) {
        await InvoiceDetail(
            id: _invoiceDscRecordId,
            createdDate: _dateTime,
            lastModifiedDate: _dateTime,
            createdDateInLocal: _dateTime,
            invoiceId: '1',
            unitProductId: unitProductId.toString(),
            quantity: quantity.toString()
        ).save();
      } else {
        await InvoiceDetail().select().id.equals(_invoiceDscRecordId).delete();
      }
    }

    getInvoiceDetailsList(context);
  }

  List<InvoiceDetail> _invoiceDetailsListFinal = [];
  List<InvoiceDetail> get invoiceDetailsListFinal =>
      _invoiceDetailsListFinal;

  int? _invoiceIdPrint = 0;
  int? get invoiceIdPrint => _invoiceIdPrint;
  setInvoiceIdPrint(int val) {
    _invoiceIdPrint = val;
    notifyListeners();
  }

  File? _qrImageFile;
  File? get qrImageFile => _qrImageFile;
  setQrImageFile(File val) async {
    _qrImageFile = val;
    notifyListeners();
  }

  addInvoiceMain(BuildContext context, BuyInvoice buyInvoice) async {
    var unitProduct = context.read<UnitProductProvider>();
    await BuyInvoice(
        createdDate: _dateTime,
        lastModifiedDate: _dateTime,
        createdDateInLocal: _dateTime,
        clientId: buyInvoice.clientId,
        totalBeforeDiscount: buyInvoice.totalBeforeDiscount,
        totalAfterDiscount: buyInvoice.totalAfterDiscount,
        totalAfterVAT: buyInvoice.totalAfterVAT,
        discountAmount: buyInvoice.discountAmount,
        vatPercent: buyInvoice.vatPercent,
    ).save();

    BuyInvoice? result = await BuyInvoice().select().orderByDesc('id').top(1).toSingle();

    setInvoiceIdPrint(result!.id!);
    _invoiceDetailsListFinal.clear();
    _invoiceDetailsList.forEach((element) {
      _invoiceDetailsListFinal.add(InvoiceDetail(
        createdDate: _dateTime,
        lastModifiedDate: _dateTime,
        createdDateInLocal: _dateTime,
        invoiceId: result.id.toString(),
        unitProductId: element.unitProductId,
        quantity: element.quantity,
      ));
    });

    await InvoiceDetail().upsertAll(_invoiceDetailsListFinal);

    await InvoiceDetail().select().invoiceId.equals(1).delete();

    _invoiceDetailsListFinal.forEach((element) async {
      await UnitsProduct()
          .select()
          .id
          .equals(element.unitProductId)
          .update({'quantity': '${double.tryParse(unitProduct.unitsProductList[int.tryParse('${element.unitProductId!}')! - 1].quantity!)! - double.tryParse("${element.quantity}")!}'});
    });

    unitProduct.getAllUnitsProduct();
    clearCacheInvoice();
    notifyListeners();
  }

  clearCacheInvoice() {
    _userId = 0;
    _totalBeforeDiscount = 0.0;
    _discountFixedAmount = 0.0;
    _discountPercentage = 0;
    _totalAfterDiscount = 0.0;
    _vat = 15;
    _totalAfterVAT = 0.0;
    _invoiceDetailsList = [];
    _invoiceDetailsListFinal = [];
    _isExistedInvoice = false;
    _unitProductIdInvoiceDsc = 0;
    _total = 0.0;
    _isInvoiceVirtual = false;
  }

}
