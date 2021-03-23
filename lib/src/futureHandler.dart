import 'dart:convert';

Future<Map<String, dynamic>> retFutureMap(Future<dynamic> myMap) async {
  String myData = (await myMap).toString();
  //print(myData.runtimeType);
  String newData = json.encode(myData);
  return json.decode(newData);
}
