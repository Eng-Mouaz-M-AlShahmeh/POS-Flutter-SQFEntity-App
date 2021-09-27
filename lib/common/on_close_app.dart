// // Eng Mouaz M. Al-Shahmeh
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sells_app/common/theme.dart';
//   Future<bool> onBackPressed(BuildContext context) async {   
//       return await showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text(
//                   'إغلاق التطبيق',
//                   style: unitText,
//                   textAlign: TextAlign.right,
//                 ),
//                 content: Text(
//                   'هل أنت متأكد أنك تريد إغلاق التطبيق؟',
//                   style: imageButtonText,
//                   textAlign: TextAlign.right,
//                 ),
//                 actions: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
//                     child: GestureDetector(
//                       onTap: () => SystemNavigator.pop(),
//                       child: Text(
//                         'نعم',
//                         style: categoryText,
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
//                     child: GestureDetector(
//                       onTap: () => Navigator.of(context).pop(false),
//                       child: Text(
//                         'لا',
//                         style: imageButtonText,
//                         textAlign: TextAlign.right,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )  ?? false;          
// }