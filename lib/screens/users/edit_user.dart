// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/button_submit.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/users/index.dart';
import 'package:sells_app/services/provider/user_provider.dart';

class EditUser extends StatelessWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserProvider>();

    final TextEditingController _usernameController =
        TextEditingController(text: user.username);
    _usernameController.value = _usernameController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: user.username.length),
      ),
    );
    final TextEditingController _mobileController =
        TextEditingController(text: user.mobile);
    _mobileController.value = _mobileController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: user.mobile.length),
      ),
    );
    final TextEditingController _nationalAddressController =
        TextEditingController(text: user.nationalAddress);
    _nationalAddressController.value =
        _nationalAddressController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: user.nationalAddress.length),
      ),
    );
    final TextEditingController _nationalIDController =
        TextEditingController(text: user.nationalID);
    _nationalIDController.value = _nationalIDController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: user.nationalID.length),
      ),
    );
    final TextEditingController _maxDebtLimitController =
        TextEditingController(text: user.maxDebtLimit);
    _maxDebtLimitController.value = _maxDebtLimitController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: user.maxDebtLimit.length),
      ),
    );
    final TextEditingController _numTermBillsController =
        TextEditingController(text: user.numTermBills);
    _numTermBillsController.value = _numTermBillsController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: user.numTermBills.length),
      ),
    );
    final TextEditingController _prevTermBalanceController =
        TextEditingController(text: user.prevTermBalance);
    _prevTermBalanceController.value =
        _prevTermBalanceController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: user.prevTermBalance.length),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'تعديل عميل',
                    style: appTheme.textTheme.headline2,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'اسم العميل',
                            ),
                            controller: _usernameController,
                            onChanged: (val) => user.setUsername(val),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'رقم الجوال: 9665xxxxxxxx',
                            ),
                            keyboardType: TextInputType.phone,
                            controller: _mobileController,
                            onChanged: (val) => user.setMobile(val),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'عنوان وطني',
                            ),
                            controller: _nationalAddressController,
                            onChanged: (val) => user.setNationalAddress(val),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'رقم الهوية: 1xxxxxxxxx',
                            ),
                            controller: _nationalIDController,
                            keyboardType: TextInputType.number,
                            onChanged: (val) => user.setNationalID(val),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                    labelText: 'الحد الأقصى للمديونية',
                                  ),
                                  controller: _maxDebtLimitController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (val) => user.setMaxDebtLimit(val),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                    labelText: 'عدد فواتير الآجل',
                                  ),
                                  controller: _numTermBillsController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (val) => user.setNumTermBills(val),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'رصيد المدة السابقة',
                            ),
                            controller: _prevTermBalanceController,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            onChanged: (val) => user.setPrevTermBalance(val),
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
                                      'مدين',
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
                                      'دائن',
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
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Expanded(
                                child: TextButton(
                                  style: buttonSubmit,
                                  onPressed: () async {
                                    await user.updateUser();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم تعديل مستند بنجاح'),
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
        ],
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
