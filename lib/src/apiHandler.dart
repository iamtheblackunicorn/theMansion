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
      print(e);
    }
  }
  Future<dynamic> readCounter() async {
    try {
      final file = await _localFile;
      String contents = file.readAsStringSync();
      var resultmap = json.decode(contents);
      print('\n');
      print('\n');
      print(resultmap.toString());
      print('\n');
      print('\n');
      return resultmap;
    } catch (e) {
      print('\n');
      print('\n');
      print(e);
      print('\n');
      print('\n');
      return {'noConnection':[
        'No Internet!',
        'No Internet!',
        'No Internet!',
        'No Internet!'
      ]};
    }
  }
}

bool isMap(Map<String,dynamic> myMap){
  bool result = false;
  if (myMap is Map<String,dynamic>){
    result = true;
  }
  else {}
  return result;
}
