// Eng Mouaz M. Al-Shahmeh
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sqfentity/sqfentity.dart';
// import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

part 'orm_config.g.dart';

/// after any edit do not forget code in terminal:
/// flutter pub run build_runner build --delete-conflicting-outputs

// This is where we define our tables
const SqfEntityTable users = SqfEntityTable(
  tableName: 'users',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('isActive', DbType.bool, defaultValue: false,),
    SqfEntityField('isCanceled', DbType.bool, defaultValue: false,),
    SqfEntityField('createdBy', DbType.text,),
    SqfEntityField('createdDate', DbType.datetime,),
    SqfEntityField('lastModifiedDate', DbType.datetime,),
    SqfEntityField('modifyBy', DbType.text,),
    SqfEntityField('createdDateInLocal', DbType.datetime,),
    SqfEntityField('username', DbType.text,),
    SqfEntityField('mobile', DbType.text,),
    SqfEntityField('nationalAddress', DbType.text,),
    SqfEntityField('nationalID', DbType.text,),
    SqfEntityField('maxDebtLimit', DbType.text,),
    SqfEntityField('numTermBills', DbType.text,),
    SqfEntityField('prevTermBalance', DbType.text,),
    SqfEntityField('debtorOrCreditor', DbType.integer,),
    SqfEntityField('knownAs', DbType.text,),
    SqfEntityField('photoUrl', DbType.text,),
  ],
);

const SqfEntityTable products = SqfEntityTable(
  tableName: 'products',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('isActive', DbType.bool, defaultValue: false,),
    SqfEntityField('isCanceled', DbType.bool, defaultValue: false,),
    SqfEntityField('createdBy', DbType.text,),
    SqfEntityField('createdDate', DbType.datetime,),
    SqfEntityField('lastModifiedDate', DbType.datetime,),
    SqfEntityField('modifyBy', DbType.text,),
    SqfEntityField('createdDateInLocal', DbType.datetime,),
    SqfEntityField('productName', DbType.text,),
    SqfEntityField('productNum', DbType.integer,),
    SqfEntityField('serialNumber', DbType.text,),
    SqfEntityField('description', DbType.text,),
    SqfEntityField('imageUrl', DbType.text,),
    SqfEntityField('catId', DbType.text,),
    SqfEntityField('vat', DbType.real,),
    SqfEntityField('canBuy', DbType.integer,),
    SqfEntityField('canSale', DbType.integer,),
  ],
);

const SqfEntityTable categories = SqfEntityTable(
  tableName: 'categories',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('isActive', DbType.bool, defaultValue: false,),
    SqfEntityField('isCanceled', DbType.bool, defaultValue: false,),
    SqfEntityField('createdBy', DbType.text,),
    SqfEntityField('createdDate', DbType.datetime,),
    SqfEntityField('lastModifiedDate', DbType.datetime,),
    SqfEntityField('modifyBy', DbType.text,),
    SqfEntityField('createdDateInLocal', DbType.datetime,),
    SqfEntityField('categoryTitle', DbType.text,),
    SqfEntityField('description', DbType.text,),
    SqfEntityField('underMainId', DbType.integer,),
    SqfEntityField('isMain', DbType.integer,),
    SqfEntityField('isSub', DbType.integer,),
  ],
);

const SqfEntityTable unitsProduct = SqfEntityTable(
  tableName: 'unitsProduct',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('isActive', DbType.bool, defaultValue: false,),
    SqfEntityField('isCanceled', DbType.bool, defaultValue: false,),
    SqfEntityField('createdBy', DbType.text,),
    SqfEntityField('createdDate', DbType.datetime,),
    SqfEntityField('lastModifiedDate', DbType.datetime,),
    SqfEntityField('modifyBy', DbType.text,),
    SqfEntityField('createdDateInLocal', DbType.datetime,),
    SqfEntityField('sellPrice', DbType.text,),
    SqfEntityField('buyPrice', DbType.text,),
    SqfEntityField('barcode', DbType.text,),
    SqfEntityField('quantity', DbType.text,),
    SqfEntityField('description', DbType.text,),
    SqfEntityField('productId', DbType.integer,),
    SqfEntityField('unitId', DbType.integer,),
  ],
);

const SqfEntityTable units = SqfEntityTable(
  tableName: 'units',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('isActive', DbType.bool, defaultValue: false,),
    SqfEntityField('isCanceled', DbType.bool, defaultValue: false,),
    SqfEntityField('createdBy', DbType.text,),
    SqfEntityField('createdDate', DbType.datetime,),
    SqfEntityField('lastModifiedDate', DbType.datetime,),
    SqfEntityField('modifyBy', DbType.text,),
    SqfEntityField('createdDateInLocal', DbType.datetime,),
    SqfEntityField('unitTitle', DbType.text,),
    SqfEntityField('size', DbType.text,),
    SqfEntityField('needBalance', DbType.text,),
  ],
);

const SqfEntityTable buyInvoices = SqfEntityTable(
  tableName: 'buyInvoices',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('isActive', DbType.bool, defaultValue: false,),
    SqfEntityField('isCanceled', DbType.bool, defaultValue: false,),
    SqfEntityField('createdBy', DbType.text,),
    SqfEntityField('createdDate', DbType.datetime,),
    SqfEntityField('lastModifiedDate', DbType.datetime,),
    SqfEntityField('modifyBy', DbType.text,),
    SqfEntityField('createdDateInLocal', DbType.datetime,),
    SqfEntityField('discountType', DbType.integer,),
    SqfEntityField('vatPercent', DbType.integer,),
    SqfEntityField('countItem', DbType.integer,),
    SqfEntityField('clientId', DbType.text,),
    SqfEntityField('clientName', DbType.text,),
    SqfEntityField('totalNetBill', DbType.text,),
    SqfEntityField('totalBeforeDiscount', DbType.text,),
    SqfEntityField('discountAmount', DbType.text,),
    SqfEntityField('totalAfterDiscount', DbType.text,),
    SqfEntityField('vatAmount', DbType.text,),
    SqfEntityField('totalAfterVAT', DbType.text,),
    SqfEntityField('totalBillFinal', DbType.text,),
    SqfEntityField('payedAmount', DbType.text,),
    SqfEntityField('remainingAmount', DbType.text,),
    SqfEntityField('notPayedAmount', DbType.text,),
  ],
);

const SqfEntityTable invoiceDetails = SqfEntityTable(
  tableName: 'invoiceDetails',
  primaryKeyName: 'id',
  useSoftDeleting: false,
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('isActive', DbType.bool, defaultValue: false,),
    SqfEntityField('isCanceled', DbType.bool, defaultValue: false,),
    SqfEntityField('createdBy', DbType.text,),
    SqfEntityField('createdDate', DbType.datetime,),
    SqfEntityField('lastModifiedDate', DbType.datetime,),
    SqfEntityField('modifyBy', DbType.text,),
    SqfEntityField('createdDateInLocal', DbType.datetime,),
    SqfEntityField('invoiceId', DbType.text,),
    SqfEntityField('unitProductId', DbType.text,),
    SqfEntityField('quantity', DbType.text,),
  ],
);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

// This is where we define our database:
@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'MyAppDatabaseModel',
  databaseName: 'myapp-db.db',
  sequences: [seqIdentity],
  databaseTables: [users,products,categories,unitsProduct,units,buyInvoices,invoiceDetails],
);