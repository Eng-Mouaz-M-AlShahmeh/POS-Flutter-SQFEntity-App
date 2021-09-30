// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/buys_invoice/index.dart';
import 'package:sells_app/services/lang/app_localizations.dart';

Future<bool> onCloseInvoice(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            AppLocalizations.of(context).translate('close_invoice')!,
            style: unitText,
            textAlign: TextAlign.right,
          ),
          content: Text(
            AppLocalizations.of(context).translate(
                'are_you_sure_you_want_close_invoice_you_will_lose_all_information')!,
            style: imageButtonText,
            textAlign: TextAlign.right,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: GestureDetector(
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BuyInvoices()),
                  (route) => false,
                ),
                child: Text(
                  AppLocalizations.of(context).translate('yes')!,
                  style: categoryText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text(
                  AppLocalizations.of(context).translate('no')!,
                  style: imageButtonText,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ) ??
      false;
}
