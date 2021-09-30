// // Eng Mouaz M. Al-Shahmeh
// const dateTimeString = '2020-07-17T03:18:31.177769-04:00';
// class BuyInvoiceModel {
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
//   String? clientId = '';
//   String? clientName = '';
//   double? totalNetBill = 0.0;
//   double? totalBeforeDiscount = 0.0;
//   double? discountAmount = 0.0;
//   double? totalAfterDiscount = 0.0;
//   double? vatAmount = 0.0;
//   double? totalAfterVAT = 0.0;
//   double? totalBillFinal = 0.0;
//   double? payedAmount = 0.0;
//   double? remainingAmount = 0.0;
//   double? notPayedAmount = 0.0;
//   int? discountType = 0;
//   int? vatPercent = 0;
//   int? countItem = 0;
//   // ....... end model things
//   BuyInvoiceModel({
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
//     this.clientId,
//     this.clientName,
//     this.totalNetBill,
//     this.totalBeforeDiscount,
//     this.discountAmount,
//     this.discountType,
//     this.totalAfterDiscount,
//     this.vatPercent,
//     this.vatAmount,
//     this.totalAfterVAT,
//     this.totalBillFinal,
//     this.payedAmount,
//     this.remainingAmount,
//     this.notPayedAmount,
//     this.countItem,
//     // ....... end model things
//   });
//   // mapping data
//   buyInvoiceMap() {
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
//     mapping['clientId'] = clientId;
//     mapping['clientName'] = clientName;
//     mapping['totalNetBill'] = totalNetBill;
//     mapping['totalBeforeDiscount'] = totalBeforeDiscount;
//     mapping['discountAmount'] = discountAmount;
//     mapping['discountType'] = discountType;
//     mapping['totalAfterDiscount'] = totalAfterDiscount;
//     mapping['vatPercent'] = vatPercent;
//     mapping['vatAmount'] = vatAmount;
//     mapping['totalAfterVAT'] = totalAfterVAT;
//     mapping['totalBillFinal'] = totalBillFinal;
//     mapping['payedAmount'] = payedAmount;
//     mapping['remainingAmount'] = remainingAmount;
//     mapping['notPayedAmount'] = notPayedAmount;
//     mapping['countItem'] = countItem;
//     // ....... end model things
//     return mapping;
//   }
//   // data from api as json
//   BuyInvoiceModel.fromJson(Map<String, dynamic> json) {
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
//     clientId = json['clientId'];
//     clientName = json['clientName'];
//     totalNetBill = json['totalNetBill'];
//     totalBeforeDiscount = json['totalBeforeDiscount'];
//     discountAmount = json['discountAmount'];
//     discountType = json['discountType'];
//     totalAfterDiscount = json['totalAfterDiscount'];
//     vatPercent = json['vatPercent'];
//     vatAmount = json['vatAmount'];
//     totalAfterVAT = json['totalAfterVAT'];
//     totalBillFinal = json['totalBillFinal'];
//     payedAmount = json['payedAmount'];
//     remainingAmount = json['remainingAmount'];
//     notPayedAmount = json['notPayedAmount'];
//     countItem = json['countItem'];
//     // ....... end model things
//   }
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
//     data['clientId'] = clientId;
//     data['clientName'] = clientName;
//     data['totalNetBill'] = totalNetBill;
//     data['totalBeforeDiscount'] = totalBeforeDiscount;
//     data['discountAmount'] = discountAmount;
//     data['discountType'] = discountType;
//     data['totalAfterDiscount'] = totalAfterDiscount;
//     data['vatPercent'] = vatPercent;
//     data['vatAmount'] = vatAmount;
//     data['totalAfterVAT'] = totalAfterVAT;
//     data['totalBillFinal'] = totalBillFinal;
//     data['payedAmount'] = payedAmount;
//     data['remainingAmount'] = remainingAmount;
//     data['notPayedAmount'] = notPayedAmount;
//     data['countItem'] = countItem;
//     // ....... end model things
//     return data;
//   }
// }
