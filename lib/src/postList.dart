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
  Future<Map<String,dynamic>> postDB;
  @override
  void initState() {
    super.initState();
    postDB = widget.apistorage.readCounter();
    /*widget.apistorage.readCounter().then((dynamic value) {
      setState((){
          postDB = json.decode(value);
      });
    });*/
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String,dynamic>>(
      future: postDB,
      builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return  Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return Center(child: new Text('${snapshot.data.runtimeType}'));  // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      }
    );
  }
}

      /*appBar: AppBar(
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
      body:new ListView.builder(
        itemCount: postDB.length,
        itemBuilder: (context, index) {
          String key = postDB.keys.elementAt(index);
          String description = postDB[key][1];
          String pictureUrl = postDB[key][4];
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
                          child: Text(
                            '$description',
                            textAlign: TextAlign.left,
                            //softWrap: true,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: stdFontSize,
                              fontFamily: defaultFont
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
}*/
