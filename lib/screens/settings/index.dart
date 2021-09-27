// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/services/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var setting = context.watch<SettingsProvider>();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'الإعدادات',
                            textAlign: TextAlign.center,
                            style: appTheme.textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                   padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                        Text(
                         'اختر نوع ورق الطباعة',
                         style: noDeleteButtonText,
                        ),
                     ],
                   ),
                ),

                Padding(
                   padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0),
                   child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        alignedDropdown: true,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<int?>(
                              hint: Text(
                                'اختر مقاس الطباعة',
                                style: appTheme.textTheme.headline5,
                              ),
                              value: setting.paperSizesId,
                              items: setting.paperSizesList
                                      .map<DropdownMenuItem<int>>((e) {
                                    return DropdownMenuItem<int>(
                                      value: int.tryParse(e['id']),
                                      child: Text(
                                        '${e["name"]}',
                                        style: appTheme.textTheme.headline5,
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (int? val) {
                                setting.setPaperSizesId(val!);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                 ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
