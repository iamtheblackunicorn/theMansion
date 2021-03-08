import 'constants.dart';
import 'apiHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterDemo extends StatefulWidget {
  final APIStorage apistorage;
  FlutterDemo({Key key, @required this.apistorage}) : super(key: key);
  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}
class _FlutterDemoState extends State<FlutterDemo> {
  String randomString;
  @override
  void initState() {
    super.initState();
    widget.apistorage.readCounter().then((dynamic value) {
      setState(() {
        randomString = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: accentColor,
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              AppLocalizations.of(context).imperativeComputerLabel,
              style: TextStyle(
                color: accentColor,
                fontSize: headingFontSize,
                fontFamily: defaultFont
              ),
            ),
          ]
        ),
        backgroundColor: bgColor
      ),
      backgroundColor: defaultBackGroundColor,
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Text(
                            'Ajax',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: tertiaryAccentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: listFontheadingSize
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Text(
                            'Niederlande',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: tertiaryAccentColor,
                              fontSize: defaultFontSize
                            ),
                          ),
                        )
                      ]
                    )
                  ]
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(choiceButtonMargin),
                      child: new RaisedButton(
                        color: accentColor,
                        child: Text(
                          AppLocalizations.of(context).detailViewMessage,
                          style: TextStyle(
                            color: defaultBackGroundColor,
                            fontSize: defaultFontSize,
                          )
                        ),
                        padding: EdgeInsets.all(choiceButtonPadding),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ClubDetailView()),
                          );
                        }
                      )
                    ),
                    SizedBox(height: choiceButtonMargin)
                  ]
                )
              ]
            )
          );
        },
      ),
    );
  }
}
