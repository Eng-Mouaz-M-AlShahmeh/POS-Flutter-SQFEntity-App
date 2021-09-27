// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/theme.dart';

class SellInvoices extends StatelessWidget {
  const SellInvoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                    'إدارة الفواتير',
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
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.document_scanner,
                                          size: 40,
                                        ),
                                        Text(
                                          'إضافة فاتورة',
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
                                          'عرض الفواتير',
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
                                          'مرتجع',
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
                                          'عرض مرتجع الفواتير',
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
    );
  }
}
