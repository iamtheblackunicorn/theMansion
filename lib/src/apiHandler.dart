import 'dart:convert'as dc;
import 'constants.dart';
import 'package:dio/dio.dart';

class APIStorage {
  Future<Map<String, dynamic>> get _localFile async {
    try {
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
