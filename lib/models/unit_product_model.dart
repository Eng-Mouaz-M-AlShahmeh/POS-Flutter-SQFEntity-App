// // Eng Mouaz M. Al-Shahmeh
//
// const dateTimeString = '2020-07-17T03:18:31.177769-04:00';
//
// class UnitProductModel {
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
//   String? sellPrice = '0';
//   String? buyPrice = '0';
//   String? barcode = '';
//   String? quantity = '0';
//   String? description = '';
//   int? productId = 0;
//   int? unitId = 0;
//   // ....... end model things
//
//   UnitProductModel? getById(int id) =>
//       UnitProductModel().id == id ? UnitProductModel() : null;
//
//   UnitProductModel({
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
//     this.sellPrice,
//     this.buyPrice,
//     this.barcode,
//     this.quantity,
//     this.description,
//     this.productId,
//     this.unitId,
//     // ....... end model things
//   });
//
//   // mapping data
//   unitProductMap() {
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
//     mapping['sellPrice'] = sellPrice;
//     mapping['buyPrice'] = buyPrice;
//     mapping['barcode'] = barcode;
//     mapping['quantity'] = quantity;
//     mapping['description'] = description;
//     mapping['productId'] = productId;
//     mapping['unitId'] = unitId;
//     // ....... end model things
//     return mapping;
//   }
//
//   // data from api as json
//   UnitProductModel.fromJson(Map<String, dynamic> json) {
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
//     sellPrice = json['sellPrice'];
//     buyPrice = json['buyPrice'];
//     barcode = json['barcode'];
//     quantity = json['quantity'];
//     description = json['description'];
//     productId = json['productId'];
//     unitId = json['unitId'];
//     // ....... end model things
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
//     data['sellPrice'] = sellPrice;
//     data['buyPrice'] = buyPrice;
//     data['barcode'] = barcode;
//     data['quantity'] = quantity;
//     data['description'] = description;
//     data['productId'] = productId;
//     data['unitId'] = unitId;
//     // ....... end model things
//     return data;
//   }
// }
