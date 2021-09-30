// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/categories/add_category.dart';
import 'package:sells_app/screens/categories/edit_category.dart';
import 'package:sells_app/screens/home/home.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = context.watch<CategoryProvider>();

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
                              '${AppLocalizations.of(context).translate('categories')!}',
                              textAlign: TextAlign.center,
                              style: appTheme.textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCategory(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text(
                              '${AppLocalizations.of(context).translate('add_new_category')!}',
                              style: addNewText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      decoration: BoxDecoration(
                        color: appTheme.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    '#',
                                    style: tableHeader,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${AppLocalizations.of(context).translate('category_name')!}',
                                    style: tableHeader,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${AppLocalizations.of(context).translate('procedures')!}',
                                    style: tableHeader,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                      child: ListView.builder(
                        itemCount: category.categoryList.length,
                        itemBuilder: (context, index) => Column(
                          children: [
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
                                  child: Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          Text(
                                            '${category.categoryList[index].id}',
                                            style: appTheme.textTheme.headline5,
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '${category.categoryList[index].categoryTitle}',
                                            style: appTheme.textTheme.headline5,
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                child: Icon(
                                                  Icons.edit,
                                                  color: appTheme.primaryColor,
                                                ),
                                                onTap: () async {
                                                  await category.getSelectedCat(
                                                      category
                                                          .categoryList[index]
                                                          .id);

                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditCategory(),
                                                    ),
                                                    (route) => false,
                                                  );
                                                },
                                              ),
                                              SizedBox(width: 10.0),
                                              InkWell(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: danger,
                                                ),
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (_) => AlertDialog(
                                                                title: Text(
                                                                  '${AppLocalizations.of(context).translate('are_you_sure_you_want_delete_record')!}',
                                                                  style: appTheme
                                                                      .textTheme
                                                                      .headline3,
                                                                ),
                                                                content:
                                                                    Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          child:
                                                                              Text(
                                                                            '${AppLocalizations.of(context).translate('cancel')!}',
                                                                            style:
                                                                                noDeleteButtonText,
                                                                          ),
                                                                          onTap: () =>
                                                                              Navigator.pop(context),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20.0,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          child:
                                                                              Text(
                                                                            '${AppLocalizations.of(context).translate('confirm')!}',
                                                                            style:
                                                                                yesDeleteButtonText,
                                                                          ),
                                                                          onTap:
                                                                              () async {
                                                                            await category.deleteCategory(index);

                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text('${AppLocalizations.of(context).translate('record_deleted_successfully')!}'),
                                                                                backgroundColor: Colors.orange,
                                                                              ),
                                                                            );
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
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
      ),
    );
  }
}
