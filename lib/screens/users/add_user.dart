// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/users/index.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/user_provider.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserProvider>();
    return WillPopScope(
      onWillPop: () async => await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UsersList()),
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
                      '${AppLocalizations.of(context).translate('add_new_customer')!}',
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
                                    '${AppLocalizations.of(context).translate('customer_name')!}',
                              ),
                              onChanged: (String? val) {
                                user.setUsername(val);
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText:
                                    '${AppLocalizations.of(context).translate('customer_mobile')!}: 9665xxxxxxxx',
                              ),
                              keyboardType: TextInputType.phone,
                              onChanged: (String? val) {
                                user.setMobile(val);
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText:
                                    '${AppLocalizations.of(context).translate('national_address')!}',
                              ),
                              onChanged: (String? val) {
                                user.setNationalAddress(val);
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText:
                                    '${AppLocalizations.of(context).translate('identity_number')!}: 1xxxxxxxxx',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (String? val) {
                                user.setNationalID(val);
                              },
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      labelText:
                                          '${AppLocalizations.of(context).translate('max_indebtedness')!}',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String? val) {
                                      user.setMaxDebtLimit(val);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      labelText:
                                          '${AppLocalizations.of(context).translate('number_of_term_bills')!}',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String? val) {
                                      user.setNumTermBills(val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText:
                                    '${AppLocalizations.of(context).translate('previous_period_balance')!}',
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              onChanged: (String? val) {
                                user.setPrevTermBalance(val);
                              },
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
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${AppLocalizations.of(context).translate('debtor')!}',
                                        style: appTheme.textTheme.headline5,
                                      ),
                                      SizedBox(width: 20.0),
                                      Consumer<UserProvider>(
                                          builder: (_, user, __) {
                                        return Radio(
                                          activeColor: appTheme.primaryColor,
                                          value: 1,
                                          groupValue: user.debtorOrCreditor,
                                          onChanged: (int? value) => user
                                              .setDebtorOrCreditorValue(value),
                                        );
                                      }),
                                      SizedBox(width: 20.0),
                                      Text(
                                        '${AppLocalizations.of(context).translate('creditor')!}',
                                        style: appTheme.textTheme.headline5,
                                      ),
                                      SizedBox(width: 20.0),
                                      Consumer<UserProvider>(
                                          builder: (_, user, __) {
                                        return Radio(
                                          activeColor: appTheme.primaryColor,
                                          value: 2,
                                          groupValue: user.debtorOrCreditor,
                                          onChanged: (int? value) => user
                                              .setDebtorOrCreditorValue(value),
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
                                          builder: (context) => UsersList(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('إلغاء'),
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
                                      await user.addUser();

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
                                          builder: (context) => UsersList(),
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
