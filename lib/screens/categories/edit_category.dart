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
import 'package:sells_app/services/provider/category_provider.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatelessWidget {
  EditCategory({Key? key}) : super(key: key);

  final GlobalKey<FormState> _editCatKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var category = context.watch<CategoryProvider>();
    final TextEditingController _titleController =
        TextEditingController(text: category.categoryTitle);
    _titleController.value = _titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: category.categoryTitle.length),
      ),
    );
    final TextEditingController _descController =
        TextEditingController(text: category.description);
    _descController.value = _descController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: category.description.length),
      ),
    );

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
          Form(
            key: _editCatKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                      'تعديل تصنيف',
                      style: appTheme.textTheme.headline2,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'اسم التصنيف',
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return requieredFeild;
                                }
                                return null;
                              },
                              controller: _titleController,
                              onSaved: (val) => category.setCategoryTitle(val),
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
                                              'تصنيف رئيسي',
                                              style:
                                                  appTheme.textTheme.headline5,
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
                                              'تصنيف فرعي',
                                              style:
                                                  appTheme.textTheme.headline5,
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
                                                    } else if (category.isSub ==
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
                                        'اختر التصنيف الرئيسي',
                                        style: appTheme.textTheme.headline5,
                                      ),
                                      value: category.underMainId,
                                      items: <DropdownMenuItem<int>>[
                                            DropdownMenuItem<int>(
                                              value: 0,
                                              child: Text(
                                                'لا يوجد',
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
                                labelText: 'ملاحظات',
                              ),
                              controller: _descController,
                              onChanged: (val) => category.setDescription(val),
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
                                          builder: (context) =>
                                              CategoriesList(),
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
                                      if (!_editCatKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      _editCatKey.currentState!.save();

                                      await category.updateCategory();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('تم تعديل مستند بنجاح'),
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
                                        child: Text('تعديل'),
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
    );
  }
}
