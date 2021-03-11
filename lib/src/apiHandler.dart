import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'constants.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class APIStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
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
      String fullPath = '$path/api.json';
      File(fullPath).writeAsStringSync(json.encode(response.data).toString());
      return File('$path/api.json');
    } catch (e) {
      final path = await _localPath;
      return File('$path/api.json');
    }
  }
  Future<Map<String,dynamic>> readCounter() async {
    final file = await _localFile;
    String contents = file.readAsStringSync();
    print(contents);
    Future<Map<String,dynamic>> resultmap = json.decode(contents);
    return resultmap;
  }
}
