import 'constants.dart';
import 'apiHandler.dart';
import 'postList.dart';
import 'infoScreen.dart';
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
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: headerImageDimensions,
                  height: headerImageDimensions
                )
              ),
              SizedBox(height: stdSpacing),
              Padding(
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  appTitle,
                  style: new TextStyle(
                    fontSize: headingFontSize,
                    fontFamily: headingFont,
                    color: accentColor
                  )
                )
              ),
              SizedBox(height: headingSpacing),
              new RaisedButton(
                color: accentColor,
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  '$postsLabel',
                  style: new TextStyle(
                    fontSize: stdFontSize,
                    fontFamily: defaultFont,
                    color: mainColor
                  )
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostOverview(apistorage: APIStorage())),
                  );
                }
              ),
              SizedBox(height: headingSpacing),
              new RaisedButton(
                color: accentColor,
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  '$infoLabel',
                  style: new TextStyle(
                    fontSize: stdFontSize,
                    fontFamily: defaultFont,
                    color: mainColor
                  )
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoScreen()),
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
