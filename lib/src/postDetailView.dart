import 'postList.dart';
import 'constants.dart';
import 'apiHandler.dart';
import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PostDetailView extends StatefulWidget {
  final APIStorage apistorage;
  final String postKey;
  PostDetailView({Key key, @required this.apistorage, @required this.postKey}) : super(key: key);
  @override
  PostDetailViewState createState() => PostDetailViewState();
}
class PostDetailViewState extends State<PostDetailView> {
  Future<Map<String,dynamic>> postDB;
  String post;
  @override
  void initState() {
    super.initState();
    postDB = widget.apistorage.readCounter();
    post = widget.postKey;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String,dynamic>>(
      future: postDB,
      builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return LoadingScreen();
        }
        else {
          if (snapshot.hasError) {
            return ErrorScreen()
          }
          else {
            Map<String, dynamic> newData = snapshot.data;
            String date = newData[post][0].split(' ')[0].split('-').join('/');
            String postUrl = newData[post][3];
            String postedOn = AppLocalizations.of(context).postedOnLabel;
            return new Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: accentColor,
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '$post',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: stdFontSize,
                        fontFamily: defaultFont
                      ),
                    ),
                  ]),
                  actions: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(right: stdPadding),
                      child: IconButton(
                        icon: Icon(
                          Icons.sync_sharp,
                          color: accentColor,
                          size: stdIconSize,
                        ),
                        onPressed: () {
                          setState((){
                            postDB = widget.apistorage.readCounter();
                          });
                        },
                      ),
                    ),
                  ],
                  backgroundColor: mainColor
                ),
                backgroundColor: mainColor,
                body: SingleChildScrollView(child: Center(
                  child: Column(
                    children: <Widget>[
                      new Stack(
                        children: <Widget>[
                          Image.network(
                            '${newData[post][4]}',
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          new Positioned(
                            bottom: 0.2,
                            left: 0.2,
                            child: Align(
                              alignment: Alignment(-0.8, 0.8),
                              child: Padding(
                                padding: EdgeInsets.all(stdPadding),
                                child: Text(
                                  '$post',
                                  style: TextStyle(
                                    color: accentColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: postHeadingFontSize,
                                    fontFamily: defaultFont
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

                            SizedBox(height:stdSpacing),
                            new Text(
                              '$postedOn $date',
                              style: TextStyle(
                                color: accentColor,
                                fontSize: stdFontSize,
                                fontFamily: defaultFont
                              )
                            ),
                            SizedBox(height:stdSpacing),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(stdRounding)
                              ),
                              color: accentColor,
                              child: Padding(padding: EdgeInsets.all(stdPadding), child:
                            new Text(
                              '${newData[post][2]}',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: stdFontSize,
                                fontFamily: defaultFont
                              )
                            )))
                          ]

                        )
                      ),
                      SizedBox(height:stdSpacing),
                      new RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(extraRounding)
                        ),
                        color: accentColor,
                        padding: EdgeInsets.all(stdPadding),
                        child: new Text(
                          AppLocalizations.of(context).visitWebsite,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: stdFontSize,
                            fontFamily: defaultFont
                          )
                        ),
                        onPressed: () async {
                          try{
                            await launch(postUrl);
                          } catch (e) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PostOverview(apistorage: APIStorage())),
                            );
                          }
                        }
                      ),
                      SizedBox(height:stdSpacing),
                    ]
                  )
                ))
            );
          }
        }
      }
    );
  }
}
