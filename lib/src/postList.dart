import 'dart:convert';
import 'constants.dart';
import 'apiHandler.dart';
import 'postDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PostOverview extends StatefulWidget {
  final APIStorage apistorage;
  PostOverview({Key key, @required this.apistorage}) : super(key: key);
  @override
  PostOverviewState createState() => PostOverviewState();
}
class PostOverviewState extends State<PostOverview> {
  Map<String,dynamic> postDB;
  @override
  void initState() {
    super.initState();
    widget.apistorage.readCounter().then((dynamic value) {
      setState(() {
        postDB = json.decode(value);
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
      body: new ListView.builder(
        itemCount: postDB.length,
        itemBuilder: (context, index) {
          String key = postDB.keys.elementAt(index);
          return new SizedBox(width: stdWidth, child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(stdRounding)
            ),
            color: accentColor,
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
                            '$key',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: stdFontSize,
                              fontFamily: defaultFont
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: new Flexible(child: Text(
                            '${postDB[key][1]}',
                            textAlign: TextAlign.left,
                            //softWrap: true,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: stdFontSize,
                              fontFamily: defaultFont
                            ),
                          )),
                        )
                      ]
                    )
                  ]
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(cardPadding),
                      child: new RaisedButton(
                        color: mainColor,
                        child: Text(
                          AppLocalizations.of(context).readLabel,
                          style: TextStyle(
                            color: accentColor,
                            fontSize: stdFontSize,
                            fontFamily: defaultFont
                          )
                        ),
                        padding: EdgeInsets.all(stdPadding),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PostDetailView(apistorage: APIStorage(), postDBKey: key)),
                          );
                        }
                      )
                    ),
                    SizedBox(height: stdPadding)
                  ]
                )
              ]
            )
          ));


        },
      ),
    );
  }
}
