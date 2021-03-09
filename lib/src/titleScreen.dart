import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String infoLabel = AppLocalizations.of(context).infoScreenLabel;
    String postsLabel = AppLocalizations.of(context).postOverViewScreen;
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [

              Padding(
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  appTitle,
                  fontSize: headingFontSize,
                  fontFamily: headingFont
                )
              ),

              new RaisedButton(
                color: accentColor,
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  '$postsLabel',
                  fontSize: stdFontSize,
                  fontFamily: defaultFont
                ),
                onPressed: () {
                  // do something
                }
              ),

              new RaisedButton(
                color: accentColor,
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  '$infoLabel',
                  fontSize: stdFontSize,
                  fontFamily: defaultFont
                ),
                onPressed: () {
                  // do something
                }
              ),

            ]
          )
        )
      )
    );
  }
}
