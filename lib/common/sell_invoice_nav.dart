// // Eng Mouaz M. Al-Shahmeh
// import 'package:flutter/material.dart';
// import 'package:sells_app/common/theme.dart';
// import 'package:sells_app/screens/sells_invoice/index.dart';
// import 'package:sells_app/screens/sells_invoice/sell_invoice.dart';
// import 'package:sells_app/screens/sells_invoice/sell_payment.dart';
// import 'package:sells_app/services/provider/app_provider.dart';
// import 'package:provider/provider.dart';
// Container sellInvoiceBNav(BuildContext context) {
//   var appProvider = context.watch<AppProvider>();
//   var screenWidth = MediaQuery.of(context).size.width;
//   return Container(
//     color: invoiceBGColor,
//     height: 60,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: TextButton(
//               child: Icon(
//                 Icons.add_shopping_cart,
//                 size: 20,
//               ),
//               style: OutlinedButton.styleFrom(
//                 primary: appProvider.invoiceNavIndex == 0
//                     ? invoiceBGColorLight
//                     : Colors.white,
//                 backgroundColor: invoiceBGColor,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(25),
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 appProvider.setInvoiceNavIndex(0);
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AddSellInvoiceProducts(),
//                   ),
//                   (route) => false,
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             width: screenWidth * 0.03,
//           ),
//           Expanded(
//             child: TextButton(
//               child: Icon(
//                 Icons.description,
//                 size: 20,
//               ),
//               style: OutlinedButton.styleFrom(
//                 primary: appProvider.invoiceNavIndex == 1
//                     ? invoiceBGColorLight
//                     : Colors.white,
//                 backgroundColor: invoiceBGColor,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(25),
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 appProvider.setInvoiceNavIndex(1);
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SellInvoice(),
//                   ),
//                   (route) => false,
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             width: screenWidth * 0.03,
//           ),
//           Expanded(
//             child: TextButton(
//               child: Icon(
//                 Icons.attach_money,
//                 size: 20,
//               ),
//               style: OutlinedButton.styleFrom(
//                 primary: appProvider.invoiceNavIndex == 2
//                     ? invoiceBGColorLight
//                     : Colors.white,
//                 backgroundColor: invoiceBGColor,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(25),
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 appProvider.setInvoiceNavIndex(2);
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SellPayment(),
//                   ),
//                   (route) => false,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
