// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/texts.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/repositories/orm_config.dart';
import 'package:sells_app/screens/categories/index.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatelessWidget {
  AddCategory({Key? key}) : super(key: key);

  final GlobalKey<FormState> _addCatKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var category = context.watch<CategoryProvider>();

    return WillPopScope(
      onWillPop: () async => await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => CategoriesList()),
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
                child: Form(
                  key: _addCatKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${AppLocalizations.of(context).translate('add_new_category')!}',
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
                                      '${AppLocalizations.of(context).translate('category_name')!}',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return requieredFeild;
                                  }
                                  return null;
                                },
                                onSaved: (String? val) =>
                                    category.setCategoryTitle(val),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
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
                                                '${AppLocalizations.of(context).translate('main_category')!}',
                                                style: appTheme
                                                    .textTheme.headline5,
                                              ),
                                              Consumer<CategoryProvider>(
                                                  builder: (_, category, __) {
                                                return FlutterSwitch(
                                                  activeColor:
                                                      appTheme.primaryColor,
                                                  width: 40.0,
                                                  height: 20.0,
                                                  valueFontSize: 15.0,
                                                  toggleSize: 15.0,
                                                  value: category.isMain,
                                                  borderRadius: 15.0,
                                                  padding: 2.0,
                                                  showOnOff: false,
                                                  onToggle: (bool? value) {
                                                    if (category.underMainId !=
                                                        0) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(role1),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      );
                                                    } else {
                                                      category.setIsMain();
                                                      if (category.isSub ==
                                                              true &&
                                                          category.isMain ==
                                                              true) {
                                                        category
                                                            .setUnderMainId(0);
                                                      }
                                                    }
                                                  },
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    child: Container(
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
                                                '${AppLocalizations.of(context).translate('sub_category')!}',
                                                style: appTheme
                                                    .textTheme.headline5,
                                              ),
                                              Consumer<CategoryProvider>(
                                                  builder: (_, category, __) {
                                                return FlutterSwitch(
                                                  activeColor:
                                                      appTheme.primaryColor,
                                                  width: 40.0,
                                                  height: 20.0,
                                                  valueFontSize: 15.0,
                                                  toggleSize: 15.0,
                                                  value: category.isSub,
                                                  borderRadius: 15.0,
                                                  padding: 2.0,
                                                  showOnOff: false,
                                                  onToggle: (bool? value) {
                                                    if (category.isMain ==
                                                            false &&
                                                        category.underMainId ==
                                                            0) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(role3),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      );
                                                    } else {
                                                      category.setIsSub();
                                                      if (category.isSub ==
                                                              true &&
                                                          category.isMain ==
                                                              true) {
                                                        category
                                                            .setUnderMainId(0);
                                                      } else if (category
                                                                  .isSub ==
                                                              false &&
                                                          category.isMain ==
                                                              false) {
                                                        category
                                                            .setUnderMainId(0);
                                                      }
                                                    }
                                                  },
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              DropdownButtonHideUnderline(
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
                                      child: DropdownButton(
                                        hint: Text(
                                          '${AppLocalizations.of(context).translate('choose_main_category')!}',
                                          style: appTheme.textTheme.headline5,
                                        ),
                                        value: category.underMainId,
                                        items: <DropdownMenuItem<int>>[
                                              DropdownMenuItem<int>(
                                                value: 0,
                                                child: Text(
                                                  '${AppLocalizations.of(context).translate('nothing')!}',
                                                  style: appTheme
                                                      .textTheme.headline5,
                                                ),
                                              )
                                            ] +
                                            category.categoryList
                                                .map<DropdownMenuItem<int>>(
                                                    (Category value) {
                                              return DropdownMenuItem<int>(
                                                value: value.id,
                                                child: Text(
                                                  '${value.categoryTitle}',
                                                  style: appTheme
                                                      .textTheme.headline5,
                                                ),
                                              );
                                            }).toList(),
                                        onChanged: (int? val) {
                                          if (category.isMain == true) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(role2),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          } else if (category.isMain == true &&
                                              category.isSub == true) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(role4),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          } else {
                                            category.setUnderMainId(val);
                                            if (category.isSub == false &&
                                                category.underMainId != 0) {
                                              category.setIsSub();
                                            } else if (category.isSub == true &&
                                                category.underMainId == 0) {
                                              category.setIsSub();
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                minLines: 6,
                                maxLines: 6,
                                decoration: textInputDecoration.copyWith(
                                  labelText:
                                      '${AppLocalizations.of(context).translate('notes')!}',
                                ),
                                onChanged: (String val) =>
                                    category.setDescription(val),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: buttonCancel,
                                      onPressed: () async {
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CategoriesList(),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      style: buttonSubmit,
                                      onPressed: () async {
                                        if (!_addCatKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        _addCatKey.currentState!.save();

                                        await category.addCategory();

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
                                            builder: (context) =>
                                                CategoriesList(),
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
            ),
          ],
        ),
        bottomNavigationBar: bottomNavBar(context),
      ),
    );
  }
}
