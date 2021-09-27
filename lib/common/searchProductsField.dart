// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/text_field.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/services/provider/product_provider.dart';
import 'package:provider/provider.dart';

class SearchProductsField extends StatelessWidget {
  const SearchProductsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = context.watch<ProductProvider>();

    final TextEditingController _searchKeyController =
        TextEditingController(text: product.keySearch);
    _searchKeyController.value = _searchKeyController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: product.keySearch!.length),
      ),
    );

    return TextFormField(
      controller: _searchKeyController,
      decoration: textInputDecoration.copyWith(
        labelText: 'بحث',
        prefixIcon: InkWell(
          onTap: () async {
            await product.searchProductsByScanBarcode();
          },
          child: Icon(
            Icons.qr_code_scanner,
            color: appTheme.primaryColor,
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            product.setKeySearch('');
            product.getAllProducts();
          },
          child: Icon(
            Icons.clear,
            color: product.keySearch == '' ? buttonColorRegular : danger,
          ),
        ),
      ),
      onChanged: (String? val) {
        if (val == null) {
          product.getAllProducts();
        }
        product.setKeySearch(val);
        product.searchProductsByKey();
      },
    );
  }
}
