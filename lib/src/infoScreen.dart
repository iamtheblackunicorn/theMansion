import 'constants.dart';
import 'titleScreen.dart';
import 'package:flutter/material.dart';
import 'package:termstyle/termstyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String byLabel = AppLocalizations.of(context).byLabel;
    String infoLabel = AppLocalizations.of(context).infoScreenLabel;
    String headBackLabel = AppLocalizations.of(context).headBackLabel;
    String unicornHead = getEmoji('unicornHead');
    String blackHeart = getEmoji('blackHeart');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: accentColor,
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              '$infoLabel',
              style: TextStyle(
                color: accentColor,
                fontSize: stdFontSize,
                fontFamily: defaultFont
              ),
            ),
          ]),
          backgroundColor: mainColor
        ),
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
                        '$infoLabel',
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
                        'The Mansion $byLabel Alexander Abraham $blackHeart\na.k.a. The Black Unicorn. $unicornHead',
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
              ),
              SizedBox(height: stdSpacing),
              new RaisedButton(
                color: accentColor,
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  '$headBackLabel',
                  style: TextStyle(
                    fontFamily: defaultFont,
                    fontSize: stdFontSize,
                    color: mainColor
                  )
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              ),

            ]
          )
        )
      )
    );
  }
}
