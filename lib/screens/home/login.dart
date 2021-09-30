// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/on_close_app.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/home/home.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/app_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    return WillPopScope(
      onWillPop: () => onCloseApp(context),
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
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _loginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('assets/images/logo.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                    labelText:
                                        '${AppLocalizations.of(context).translate('user_name')!}',
                                    suffixIcon: Icon(
                                      Icons.person,
                                      color: appTheme.primaryColor,
                                    ),
                                  ),
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return '${AppLocalizations.of(context).translate('requiered_field')!}';
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 10.0),
                              TextFormField(
                                  obscureText: true,
                                  decoration: textInputDecoration.copyWith(
                                    labelText:
                                        '${AppLocalizations.of(context).translate('password')!}',
                                    suffixIcon: Icon(
                                      Icons.lock,
                                      color: appTheme.primaryColor,
                                    ),
                                  ),
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return '${AppLocalizations.of(context).translate('requiered_field')!}';
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(height: 10.0),
                              OutlinedButton(
                                onPressed: () {
                                  if (!_loginKey.currentState!.validate()) {
                                    return null;
                                  } else {
                                    appProvider.setBottomNavBarIndex(0);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  }
                                },
                                style: buttonSubmit.copyWith(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    '${AppLocalizations.of(context).translate('login')!}',
                                    style: appTheme.textTheme.headline4,
                                  ),
                                )),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '${AppLocalizations.of(context).translate('forget_password')!}',
                                style: appTheme.textTheme.headline3,
                              ),
                              SizedBox(height: 10.0),
                              OutlinedButton(
                                onPressed: () {},
                                style: buttonSubmit.copyWith(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/google.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
