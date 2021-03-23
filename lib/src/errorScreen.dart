import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    String errorString = AppLocalizations.of(context).errorLabel;
    return  Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(
          color: accentColor,
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              AppLocalizations.of(context).postOverViewScreen,
              style: TextStyle(
                color: accentColor,
                fontSize: stdFontSize,
                fontFamily: defaultFont
              ),
            ),
          ]
        ),
        backgroundColor: mainColor
      ),
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          children: <Widget> [
            new SizedBox(
              height: miscScreenSpacing
            ),
            new Icon(
              Icons.warning,
              color: accentColor,
              size: miscScreenIconSize,
            ),
            new Text(
              '$errorString',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.bold,
                fontSize: stdFontSize,
                fontFamily: defaultFont
              ),
            )
          ]
        )
      )
    );
  }
}
