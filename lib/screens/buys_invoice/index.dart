// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/buys_invoice/buy_invoice.dart';
import 'package:sells_app/screens/home/home.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/app_provider.dart';
import 'package:provider/provider.dart';

class BuyInvoices extends StatelessWidget {
  const BuyInvoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = context.watch<AppProvider>();

    return WillPopScope(
      onWillPop: () async => await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
        (route) => false,
      ),
      child: Scaffold(
        backgroundColor: appTheme.backgroundColor,
        body: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: appTheme.backgroundColor,
                child: Image(
                  image: AssetImage('assets/images/bg2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${AppLocalizations.of(context).translate('invoices_manage')!}',
                      style: appTheme.textTheme.headline2,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: buttonSubmit,
                                    onPressed: () {
                                      appProvider.setBottomNavBarIndex(2);
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BuyInvoice()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.document_scanner,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('add_invoice')!}',
                                            style: buttonHomeText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                Expanded(
                                  child: TextButton(
                                    style: buttonSubmit,
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.description,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('view_invoices')!}',
                                            style: buttonHomeText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: buttonSubmit,
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.restore,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('reactionary')!}',
                                            style: buttonHomeText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                Expanded(
                                  child: TextButton(
                                    style: buttonSubmit,
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.restore_page,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('view_reactionary_invoices')!}',
                                            style: buttonHomeText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomNavBar(context),
      ),
    );
  }
}
