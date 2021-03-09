import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

Dio dio = new Dio();
String apiUrl = 'https://blckunicorn.art/content/api/';
String appTitle = 'The Mansion';
String headingFont = 'Ostrich';
String defaultFont = 'Lobster';
Color accentColor = Color(0xFFDF0045);
Color mainColor = Color(0xFF000000);
double headingFontSize = 40;
double stdPadding = 7;
double stdFontSize = 20;
double stdRounding = 25;
double headingSpacing = 50;
double stdSpacing = 20;
double cardPadding = 10;
double stdWidth = 200;
double postHeadingFontSize = 25;
double extraRounding = 25;
Map<String, dynamic> defaultMap = {
  'No Internet': [
    'API Fail.',
    'Could not fetch the API.',
    'There was an error fetching the API!',
    'https://blckunicorn.art/assets/images/logo/logo.svg'
  ]
};
