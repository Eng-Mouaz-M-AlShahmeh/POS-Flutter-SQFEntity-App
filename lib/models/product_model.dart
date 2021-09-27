// // Eng Mouaz M. Al-Shahmeh
//
// const dateTimeString = '2020-07-17T03:18:31.177769-04:00';
//
// class ProductModel {
//   // ....... begin famous things
//   int? id = 0;
//   bool? isActive = false;
//   bool? isCanceled = false;
//   String? createdBy = '';
//   DateTime? createdDate = DateTime.now();
//   DateTime? lastModifiedDate =
//       DateTime.parse(dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
//   String? modifyBy = '';
//   DateTime? createdDateInLocal =
//       DateTime.parse(dateTimeString.replaceFirst(RegExp(r'-\d\d:\d\d'), ''));
//   // ....... end famous things
//   // ....... begin model things
//   String? productName = '';
//   String? productNum = '';
//   String? serialNumber = '';
//   // List<UnitProductModel>? productUnits = List<UnitProductModel>.empty();
//   // CategoryModel? productCategory = CategoryModel();
//   String? description = '';
//   String? imageUrl = '';
//   int? catId = 0;
//   // ....... end model things
//   // ....... begin control-panel
//   double? vat = 0.0;
//   bool? canBuy = true;
//   bool? canSale = true;
//   // ....... end control-panel
//
//   ProductModel({
//     // ....... begin famous things
//     this.id,
//     this.isActive,
//     this.isCanceled,
//     this.createdBy,
//     this.createdDate,
//     this.lastModifiedDate,
//     this.modifyBy,
//     this.createdDateInLocal,
//     // ....... end famous things
//     // ....... begin model things
//     this.productName,
//     this.productNum,
//     this.serialNumber,
//     // this.productUnits,
//     // this.productCategory,
//     this.description,
//     this.imageUrl,
//     this.catId,
//     // ....... end model things
//     // ....... begin control-panel
//     this.vat,
//     this.canBuy,
//     this.canSale,
//     // ....... end control-panel
//   });
//
//   // mapping data
//   productMap() {
//     var mapping = Map<String, dynamic>();
//     // ....... begin famous things
//     mapping['id'] = id;
//     mapping['isActive'] = isActive;
//     mapping['isCanceled'] = isCanceled;
//     mapping['createdBy'] = createdBy;
//     mapping['createdDate'] = createdDate;
//     mapping['lastModifiedDate'] = lastModifiedDate;
//     mapping['modifyBy'] = modifyBy;
//     mapping['createdDateInLocal'] = createdDateInLocal;
//     // ....... end famous things
//     // ....... begin model things
//     mapping['productName'] = productName;
//     mapping['productNum'] = productNum;
//     mapping['serialNumber'] = serialNumber;
//     // mapping['productUnits'] = productUnits;
//     // mapping['productCategory'] = productCategory;
//     mapping['description'] = description;
//     mapping['imageUrl'] = imageUrl;
//     mapping['catId'] = catId;
//     // ....... end model things
//     // ....... begin control-panel
//     mapping['vat'] = vat;
//     mapping['canBuy'] = canBuy;
//     mapping['canSale'] = canSale;
//     // ....... end control-panel
//     return mapping;
//   }
//
//   // data from api as json
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     // ....... begin famous things
//     id = json['id'];
//     isActive = json['isActive'];
//     isCanceled = json['isCanceled'];
//     createdBy = json['createdBy'];
//     createdDate = json['createdDate'];
//     lastModifiedDate = json['lastModifiedDate'];
//     modifyBy = json['modifyBy'];
//     createdDateInLocal = json['createdDateInLocal'];
//     // ....... end famous things
//     // ....... begin model things
//     productName = json['productName'];
//     productNum = json['productNum'];
//     serialNumber = json['serialNumber'];
//     // productUnits = json['productUnits'];
//     // productCategory = json['productCategory'];
//     description = json['description'];
//     imageUrl = json['imageUrl'];
//     catId = json['catId'];
//     // ....... end model things
//     // ....... begin control-panel
//     vat = json['vat'];
//     canBuy = json['canBuy'];
//     canSale = json['canSale'];
//     // ....... end control-panel
//   }
//
//   // data to api as json from model
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     // ....... begin famous things
//     data['id'] = id;
//     data['isActive'] = isActive;
//     data['isCanceled'] = isCanceled;
//     data['createdBy'] = createdBy;
//     data['createdDate'] = createdDate;
//     data['lastModifiedDate'] = lastModifiedDate;
//     data['modifyBy'] = modifyBy;
//     data['createdDateInLocal'] = createdDateInLocal;
//     // ....... end famous things
//     // ....... begin model things
//     data['productName'] = productName;
//     data['productNum'] = productNum;
//     data['serialNumber'] = serialNumber;
//     // data['productUnits'] = productUnits;
//     // data['productCategory'] = productCategory;
//     data['description'] = description;
//     data['imageUrl'] = imageUrl;
//     data['catId'] = catId;
//     // ....... end model things
//     // ....... begin control-panel
//     data['vat'] = vat;
//     data['canBuy'] = canBuy;
//     data['canSale'] = canSale;
//     // ....... end control-panel
//     return data;
//   }
// }
