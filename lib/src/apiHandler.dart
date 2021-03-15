import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'dart:convert'as dc;
import 'constants.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
class APIStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<Map<String, dynamic>> get _localFile async {
    try {
      final path = await _localPath;
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return dc.json.decode(response.data);
    } catch (e) {
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return dc.json.decode(response.data);
    }
  }
  Future<Map<String,dynamic>> readCounter() async {
    Future<Map<String, dynamic>> data = _localFile;
    return data;
  }
}
