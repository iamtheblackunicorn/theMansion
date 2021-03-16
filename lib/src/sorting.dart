Future<Map<String, dynamic>> makeFutureMap(Map<String, dynamic> myDataMap) async {
  return myDataMap;
}
Future<Map<String, dynamic>> sortMapByKeys(Future<Map<String, dynamic>> myDataMap) async {
  Map<String, dynamic> dataMap = await myDataMap;
  List<String> keyList = dataMap.keys.toList();
  keyList.sort((a, b) => a.length.compareTo(b.length));
  Map<String, dynamic> result = {};
  for (int i = 0; i < keyList.length; i++) {
    result.addAll({keyList[i]:dataMap[keyList[i]]});
  }
  return makeFutureMap(result);
}
