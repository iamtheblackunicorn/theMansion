import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [

              new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(stdRounding)
                ),
                color: accentColor,
                margin: EdgeInsets.all(stdPadding),
                child: Column(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(stdRounding),
                      child: new Text(
                        AppLocalizations.of(context).infoLabel,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: defaultFont,
                          fontSize: headingFontSize,
                          color: mainColor
                        )
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(stdRounding),
                      child: new Text(
                        'The Mansion by Alexander Abraham\na.k.a. The Black Unicorn',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: defaultFont,
                          fontSize: stdFontSize,
                          color: mainColor
                        )
                      ),
                    ),
                  ]
                )
              )

              new RaisedButton(
                color: accentColor,
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  appTitle,
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
