// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/units/index.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/unit_provider.dart';

class AddUnit extends StatelessWidget {
  const AddUnit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unit = context.watch<UnitProvider>();
    return WillPopScope(
      onWillPop: () async => await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UnitsList()),
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
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${AppLocalizations.of(context).translate('add_new_unit')!}',
                      style: appTheme.textTheme.headline2,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText:
                                    '${AppLocalizations.of(context).translate('unit_name')!}',
                              ),
                              onChanged: (String val) => unit.setUnitTitle(val),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText:
                                    '${AppLocalizations.of(context).translate('size')!}',
                              ),
                              onChanged: (String val) => unit.setSize(val),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${AppLocalizations.of(context).translate('need_balance')!}',
                                        style: appTheme.textTheme.headline5,
                                      ),
                                      SizedBox(width: 20.0),
                                      Consumer<UnitProvider>(
                                          builder: (_, unit, __) {
                                        return FlutterSwitch(
                                          activeColor: appTheme.primaryColor,
                                          width: 40.0,
                                          height: 20.0,
                                          valueFontSize: 15.0,
                                          toggleSize: 15.0,
                                          value: unit.needBalance,
                                          borderRadius: 15.0,
                                          padding: 2.0,
                                          showOnOff: false,
                                          onToggle: (bool? value) =>
                                              unit.setNeedBalance(),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: buttonCancel,
                                    onPressed: () async {
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UnitsList(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                            '${AppLocalizations.of(context).translate('cancel')!}'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Expanded(
                                  child: TextButton(
                                    style: buttonSubmit,
                                    onPressed: () async {
                                      await unit.addUnit();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '${AppLocalizations.of(context).translate('record_sent_successfully')!}'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UnitsList(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                            '${AppLocalizations.of(context).translate('send')!}'),
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
