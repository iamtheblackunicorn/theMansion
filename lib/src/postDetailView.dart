import 'constants.dart';
import 'apiHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class PostDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultBackGroundColor,
        body: Center(
          child: Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Positioned(
                    bottom: 0.2,
                    left: 0.2,
                    child: Align(
                      alignment: Alignment(-0.8, 0.8),
                      child: Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: Text(
                          'Ajax Amsterdam',
                          style: TextStyle(
                            color: tertiaryAccentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: clubNameheading
                          ),
                        )
                      )
                    )
                  )
                ]
              ),
              new Padding(
                padding: EdgeInsets.all(cardPadding),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '$worthTemplateText 442 $currencyLabel',
                      style: TextStyle(
                        color: tertiaryAccentColor,
                        fontSize: defaultFontSize
                      )
                    ),
                    new Text(
                      'Ajax Amsterdam $achievedMessage 4 $titleMessage',
                      style: TextStyle(
                        color: tertiaryAccentColor,
                        fontSize: defaultFontSize
                      )
                    )
                  ]
                )
              ),
            ]
          )
        )
      );
    }
  }
