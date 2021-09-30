// // Eng Mouaz M. Al-Shahmeh
// const dateTimeString = '2020-07-17T03:18:31.177769-04:00';
// class UnitModel {
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
//   String? unitTitle = '';
//   String? size = '0';
//   String? needBalance = '';
//   // ....... end model things
//   UnitModel({
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
//     this.unitTitle,
//     this.size,
//     this.needBalance,
//     // ....... end model things
//   });
//   // mapping data
//   unitMap() {
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
//     mapping['unitTitle'] = unitTitle;
//     mapping['size'] = size;
//     mapping['needBalance'] = needBalance;
//     // ....... end model things
//     return mapping;
//   }
//   // data from api as json
//   UnitModel.fromJson(Map<String, dynamic> json) {
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
//     unitTitle = json['unitTitle'];
//     size = json['size'];
//     needBalance = json['needBalance'];
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
//     data['unitTitle'] = unitTitle;
//     data['size'] = size;
//     data['needBalance'] = needBalance;
//     // ....... end model things
//     return data;
//   }
// }
