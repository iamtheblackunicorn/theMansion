import 'constants.dart';
import 'apiHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PostDetailView extends StatefulWidget {
  final APIStorage apistorage;
  final String postDBKey;
  PostDetailView({Key key, @required this.apistorage, @required this.postDBKey}) : super(key: key);
  @override
  PostDetailViewState createState() => PostDetailViewState();
}
class PostDetailViewState extends State<PostDetailView> {
  Map<String,dynamic> postDB;
  String key;
  @override
  void initState() {
    super.initState();
    widget.apistorage.readCounter().then((dynamic value) {
      setState(() {
        postDB = value;
      });
    });
    widget.postDBKey.then((String value) {
      setState(() {
        key = value;
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
              '$key',
              style: TextStyle(
                color: accentColor,
                fontSize: stdFontSize,
                fontFamily: defaultFont
              ),
            ),
          ]),
          backgroundColor: mainColor
        ),
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
                        padding: EdgeInsets.all(stdPadding),
                        child: Text(
                          '$key',
                          style: TextStyle(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: stdFontSize,
                            fontFamily: headingFont
                          ),
                        )
                      )
                    )
                  )
                ]
              ),
              new Padding(
                padding: EdgeInsets.all(stdPadding),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '${postDB[key][0]}',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: stdFontSize,
                        fontFamily: defaultFont
                      )
                    ),
                    new Text(
                      '${postDB[key][2]}',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: stdFontSize,
                        fontFamily: defaultFont
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
