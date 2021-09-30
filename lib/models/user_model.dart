// // Eng Mouaz M. Al-Shahmeh
// const dateTimeString = '2020-07-17T03:18:31.177769-04:00';
// class UserModel {
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
//   String? username = '';
//   // List<Uint8List>? passwordHash = <Uint8List>[];
//   // List<Uint8List>? passwordSalt = <Uint8List>[];
//   String? mobile = '';
//   String? nationalAddress = '';
//   String? nationalID = '0';
//   String? maxDebtLimit = '0';
//   String? numTermBills = '1';
//   String? prevTermBalance = '0.0';
//   int? debtorOrCreditor = 1;
//   String? knownAs = '';
//   String? photoUrl = '';
//   // ....... end model things
//   UserModel({
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
//     this.username,
//     // this.passwordHash,
//     // this.passwordSalt,
//     this.mobile,
//     this.nationalAddress,
//     this.nationalID,
//     this.maxDebtLimit,
//     this.numTermBills,
//     this.prevTermBalance,
//     this.debtorOrCreditor,
//     this.knownAs,
//     this.photoUrl,
//     // ....... end model things
//   });
//   // mapping data
//   userMap() {
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
//     mapping['username'] = username;
//     // mapping['passwordHash'] = passwordHash;
//     // mapping['passwordSalt'] = descpasswordSaltription;
//     mapping['mobile'] = mobile;
//     mapping['nationalAddress'] = nationalAddress;
//     mapping['nationalID'] = nationalID;
//     mapping['maxDebtLimit'] = maxDebtLimit;
//     mapping['numTermBills'] = numTermBills;
//     mapping['prevTermBalance'] = prevTermBalance;
//     mapping['debtorOrCreditor'] = debtorOrCreditor;
//     mapping['knownAs'] = knownAs;
//     mapping['photoUrl'] = photoUrl;
//     // ....... end model things
//     return mapping;
//   }
//   // data from api as json
//   UserModel.fromJson(Map<String, dynamic> json) {
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
//     username = json['username'];
//     // passwordHash = json['passwordHash'];
//     // passwordSalt = json['passwordSalt'];
//     mobile = json['mobile'];
//     nationalAddress = json['nationalAddress'];
//     nationalID = json['nationalID'];
//     maxDebtLimit = json['maxDebtLimit'];
//     numTermBills = json['numTermBills'];
//     prevTermBalance = json['prevTermBalance'];
//     debtorOrCreditor = json['debtorOrCreditor'];
//     knownAs = json['knownAs'];
//     photoUrl = json['photoUrl'];
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
//     data['username'] = username;
//     // data['passwordHash'] = passwordHash;
//     // data['passwordSalt'] = passwordSalt;
//     data['mobile'] = mobile;
//     data['nationalAddress'] = nationalAddress;
//     data['nationalID'] = nationalID;
//     data['maxDebtLimit'] = maxDebtLimit;
//     data['numTermBills'] = numTermBills;
//     data['prevTermBalance'] = prevTermBalance;
//     data['debtorOrCreditor'] = debtorOrCreditor;
//     data['knownAs'] = knownAs;
//     data['photoUrl'] = photoUrl;
//     // ....... end model things
//     return data;
//   }
// }
