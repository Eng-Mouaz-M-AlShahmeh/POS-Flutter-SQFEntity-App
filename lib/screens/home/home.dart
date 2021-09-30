// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/on_close_app.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/buys_invoice/index.dart';
import 'package:sells_app/screens/categories/index.dart';
import 'package:sells_app/screens/sells_invoice/index.dart';
import 'package:sells_app/screens/settings/index.dart';
import 'package:sells_app/screens/units/index.dart';
import 'package:sells_app/screens/products/index.dart';
import 'package:sells_app/screens/users/index.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/services/provider/buy_invoice_provider.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:sells_app/services/provider/unit_product_provider.dart';
import 'package:sells_app/services/provider/unit_provider.dart';
import 'package:sells_app/services/provider/user_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = context.watch<AppProvider>();
    var unit = context.read<UnitProvider>();
    var category = context.read<CategoryProvider>();
    var product = context.read<ProductProvider>();
    var unitproduct = context.read<UnitProductProvider>();
    var user = context.read<UserProvider>();
    var buyInvoice = context.read<BuyInvoiceProvider>();

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
                      '${AppLocalizations.of(context).translate('home')!}',
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
                                      user.getAllUsers();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UsersList()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.people,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('customers_manage')!}',
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
                                            Icons.badge,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('suppliers_manage')!}',
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
                                    onPressed: () {
                                      appProvider.setBottomNavBarIndex(2);
                                      appProvider.setInvoiceNavIndex(0);
                                      category.getAllCategories();
                                      unit.getAllUnits();
                                      product.getAllProducts();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductsList()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.shopping_cart,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('products_manage')!}',
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
                                            Icons.store,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('stores_manage')!}',
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
                                    onPressed: () {
                                      appProvider.setBottomNavBarIndex(2);
                                      category.getAllCategories();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CategoriesList()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.category,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('categories_manage')!}',
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
                                    onPressed: () {
                                      appProvider.setBottomNavBarIndex(2);
                                      unit.getAllUnits();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UnitsList()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.ad_units,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('units_manage')!}',
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
                                    onPressed: () {
                                      appProvider.setBottomNavBarIndex(2);
                                      appProvider.setInvoiceNavIndex(1);
                                      category.getAllCategories();
                                      product.getAllProducts();
                                      unit.getAllUnits();
                                      unitproduct.getAllUnitsProduct();
                                      buyInvoice.getInvoiceDetailsList(context);
                                      user.getAllUsers();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BuyInvoices()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.point_of_sale,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('buys_invoices')!}',
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
                                    onPressed: () {
                                      appProvider.setBottomNavBarIndex(2);
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SellInvoices()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.receipt_long,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('sells_invoices')!}',
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
                                            Icons.monetization_on,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('outgoings')!}',
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
                                            Icons.receipt,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('receipts')!}',
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
                                    onPressed: () {
                                      appProvider.setBottomNavBarIndex(2);
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Settings()),
                                        (route) => false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.settings,
                                            size: 40,
                                          ),
                                          Text(
                                            '${AppLocalizations.of(context).translate('settings')!}',
                                            style: buttonHomeText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: SizedBox(width: 20.0),
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
