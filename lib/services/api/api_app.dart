// Eng Mouaz M. Al-Shahmeh
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class API {
  String _apiKey = 'aswe@3fcdMMjhfd87547&%&';
  var _baseUrl = Uri.parse('https://www.domain.com/');

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  Future<dynamic> func1(BuildContext context, String name) async {
    final response =
        await http.post(_baseUrl, body: {'apiKey': _apiKey, 'name': name});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> func2(BuildContext context, String name,
      List<File> imagesList, File file) async {
    final uri = Uri.parse('$_baseUrl');
    var request = http.MultipartRequest('POST', uri);
    request.fields['apiKey'] = _apiKey;
    request.fields['name'] = name;
    imagesList.map((image) async =>
        await http.MultipartFile.fromPath('imagesList[]', image.path)
            .then((value) {
          request.files.add(value);
        }));
    await http.MultipartFile.fromPath('file', file.path)
        .then((value) => request.files.add(value));
    var response = await request.send();
    if (response.statusCode == 200) {
      return response;
    } else {
      return false;
    }
  }
}
