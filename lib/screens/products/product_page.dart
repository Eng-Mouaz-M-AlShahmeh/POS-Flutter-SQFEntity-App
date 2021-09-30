// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/backButton.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/products/index.dart';
import 'package:sells_app/services/lang/app_localizations.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProductsList()),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: backButton(context),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${AppLocalizations.of(context).translate('product_details')!}',
                              textAlign: TextAlign.center,
                              style: appTheme.textTheme.headline2,
                            ),
                          ),
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(''),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomNavBar(context),
      ),
    );
  }
}
