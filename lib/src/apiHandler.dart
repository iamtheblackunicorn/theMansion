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
      print(response.data.runtimeType);
      String fullPath = '$path/api.json';
      File(fullPath).writeAsStringSync(dc.json.encode(response.data).toString());
      return File('$path/api.json');
    } catch (e) {
      final path = await _localPath;
      return File('$path/api.json');
    }
  }
  Future<Map<String,dynamic>> readCounter() async {
    final file = await _localFile;
    String contents = await file.readAsString();
    //print(dc.json.decode(contents)['Rebecca']);
    Map<String, dynamic> myData = Map<String, dynamic>.from(dc.json.decode(contents));
    return myData;
  }
}
