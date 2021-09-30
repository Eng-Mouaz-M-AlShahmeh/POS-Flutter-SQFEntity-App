// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/bottom_nav_bar.dart';
import 'package:sells_app/common/buy_invoice_nav.dart';
import 'package:sells_app/common/on_close_invoice.dart';
import 'package:sells_app/common/print_a4.dart';
import 'package:sells_app/common/print_small.dart';
import 'package:sells_app/common/qr_image.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/repositories/orm_config.dart';
import 'package:sells_app/services/lang/app_localizations.dart';
import 'package:sells_app/services/provider/buy_invoice_provider.dart';
import 'package:sells_app/services/provider/settings_provider.dart';
import 'package:sells_app/services/provider/user_provider.dart';
import 'package:provider/provider.dart';

class BuyPayment extends StatelessWidget {
  const BuyPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserProvider>();
    var buyInvoice = context.watch<BuyInvoiceProvider>();
    var setting = context.watch<SettingsProvider>();

    final TextEditingController _discountFixedAmountController =
        TextEditingController(text: buyInvoice.discountFixedAmount.toString());
    _discountFixedAmountController.value =
        _discountFixedAmountController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
            offset: buyInvoice.discountFixedAmount.toString().length - 2),
      ),
    );

    final TextEditingController _discountPercentageController =
        TextEditingController(text: buyInvoice.discountPercentage.toString());
    _discountPercentageController.value =
        _discountPercentageController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: buyInvoice.discountPercentage.toString().length),
      ),
    );

    final TextEditingController _vatController =
        TextEditingController(text: buyInvoice.vat.toString());
    _vatController.value = _vatController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: buyInvoice.vat.toString().length),
      ),
    );

    return WillPopScope(
      onWillPop: () => onCloseInvoice(context),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                                AppLocalizations.of(context)
                                    .translate('invoice_payment')!,
                                textAlign: TextAlign.center,
                                style: invoiceHeaderStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                                      child: DropdownButton(
                                        hint: Text(
                                          AppLocalizations.of(context)
                                              .translate('choose_customer')!,
                                          style: appTheme.textTheme.headline5,
                                        ),
                                        value: buyInvoice.userId,
                                        items: <DropdownMenuItem<int>>[
                                              DropdownMenuItem<int>(
                                                value: 0,
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .translate('nothing')!,
                                                  style: appTheme
                                                      .textTheme.headline5,
                                                ),
                                              )
                                            ] +
                                            user.userList
                                                .map<DropdownMenuItem<int>>(
                                                    (User user) {
                                              return DropdownMenuItem<int>(
                                                value: user.id,
                                                child: Text(
                                                  '${user.username}',
                                                  style: appTheme
                                                      .textTheme.headline5,
                                                ),
                                              );
                                            }).toList(),
                                        onChanged: (int? val) {
                                          if (val != 0) {
                                            buyInvoice.setUserId(
                                                user.userList[val! - 1].id);
                                          } else {
                                            buyInvoice.setUserId(0);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.045,
                                decoration: BoxDecoration(
                                  color: appTheme.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            Text(
                                              '${AppLocalizations.of(context).translate('total_before_discount')!}: ${buyInvoice.totalBeforeDiscount.toStringAsFixed(2)} ${AppLocalizations.of(context).translate('sar')!}',
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Container(
                                decoration: BoxDecoration(
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
                                          AppLocalizations.of(context)
                                              .translate('discount_amount')!,
                                          style: appTheme.textTheme.headline5,
                                        ),
                                        SizedBox(width: 20.0),
                                        Expanded(
                                          child: TextFormField(
                                            decoration:
                                                textInputDecoration.copyWith(
                                              labelText: AppLocalizations.of(
                                                      context)
                                                  .translate('fixed_amount')!,
                                            ),
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            controller:
                                                _discountFixedAmountController,
                                            onChanged: (val) {
                                              buyInvoice.setDiscountFixedAmount(
                                                  double.tryParse(val)!);
                                              buyInvoice.setDiscountPercentage(
                                                  double.tryParse(
                                                          '${(double.tryParse("$val")! / double.tryParse("${buyInvoice.totalBeforeDiscount}")!) * 100.0}')!
                                                      .round());
                                              buyInvoice
                                                  .setTotalAfterDiscount();
                                              buyInvoice.setTotalAfterVAT();
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: TextFormField(
                                            decoration:
                                                textInputDecoration.copyWith(
                                              labelText:
                                                  AppLocalizations.of(context)
                                                      .translate('percentage')!,
                                            ),
                                            keyboardType: TextInputType.number,
                                            controller:
                                                _discountPercentageController,
                                            onChanged: (val) {
                                              buyInvoice.setDiscountPercentage(
                                                  int.tryParse(val)!);
                                              buyInvoice.setDiscountFixedAmount(
                                                  double.tryParse(
                                                      '${(double.tryParse("$val")! * double.tryParse("${buyInvoice.totalBeforeDiscount}")!) / 100.0}')!);
                                              buyInvoice
                                                  .setTotalAfterDiscount();
                                              buyInvoice.setTotalAfterVAT();
                                            },
                                          ),
                                        ),
                                        Text(
                                          ' % ',
                                          style: appTheme.textTheme.headline5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.045,
                                decoration: BoxDecoration(
                                  color: appTheme.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            Text(
                                              '${AppLocalizations.of(context).translate('total_after_discount')!}: ${buyInvoice.totalAfterDiscount.toStringAsFixed(2)} ${AppLocalizations.of(context).translate('sar')!}',
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${AppLocalizations.of(context).translate('vat_percentage')!}: ',
                                                style: appTheme
                                                    .textTheme.headline5,
                                              ),
                                            ),
                                            Container(
                                              width: 60,
                                              child: TextFormField(
                                                decoration:
                                                    textInputDecorationVAT,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _vatController,
                                                onChanged: (val) {
                                                  buyInvoice.setVAT(
                                                      int.tryParse(val)!);
                                                  buyInvoice.setTotalAfterVAT();
                                                },
                                              ),
                                            ),
                                            Text(
                                              ' % ',
                                              style:
                                                  appTheme.textTheme.headline5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.0),
                                        Text(
                                          '${AppLocalizations.of(context).translate('total_after_vat')!}: ${buyInvoice.totalAfterVAT.toStringAsFixed(2)} ${AppLocalizations.of(context).translate('sar')!}',
                                          style: vatFinalText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: InkWell(
                                onTap: () async {
                                  await buyInvoice.setQrImageFile(await qrImage(
                                      context,
                                      '${AppLocalizations.of(context).translate('total_final')!}: ${buyInvoice.totalAfterVAT}'));

                                  if (setting.paperSizesId == 1) {
                                    await printPdfA4(context);
                                  } else if (setting.paperSizesId == 2 ||
                                      setting.paperSizesId == 3) {
                                    await printPdfSmall(context);
                                  }

                                  await buyInvoice.addInvoiceMain(
                                    context,
                                    BuyInvoice(
                                      clientId: buyInvoice.userId.toString(),
                                      totalBeforeDiscount: buyInvoice
                                          .totalBeforeDiscount
                                          .toString(),
                                      totalAfterDiscount: buyInvoice
                                          .totalAfterDiscount
                                          .toString(),
                                      totalAfterVAT:
                                          buyInvoice.totalAfterVAT.toString(),
                                      discountAmount: buyInvoice
                                          .discountFixedAmount
                                          .toString(),
                                      vatPercent: buyInvoice.vat,
                                    ),
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: buttonColorRegular,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        '${AppLocalizations.of(context).translate('pay')!}',
                                        style: tableHeader,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: buyInvoiceBNav(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: bottomNavBar(context),
        ),
      ),
    );
  }
}
