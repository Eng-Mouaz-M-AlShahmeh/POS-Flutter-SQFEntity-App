// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/common/splash.dart';
import 'package:sells_app/common/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sells_app/services/provider/app_provider.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:sells_app/services/provider/buy_invoice_provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:sells_app/services/provider/settings_provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';
import 'package:sells_app/services/provider/unit_provider.dart';
import 'package:sells_app/services/provider/user_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(create: (context) => AppProvider()),
        ChangeNotifierProvider<SettingsProvider>(create: (context) => SettingsProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<UnitProvider>(
            create: (context) => UnitProvider()),
        ChangeNotifierProvider<UnitProductProvider>(
            create: (context) => UnitProductProvider()),
        ChangeNotifierProvider<BuyInvoiceProvider>(
            create: (context) => BuyInvoiceProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localeListResolutionCallback: (locales, supportedLocales) {
          return Locale('ar', 'SA');
        },
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'AlRaedah App',
        theme: appTheme,
        home: SplashLogo(),
      ),
    );
  }
}
