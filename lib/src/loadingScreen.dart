import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:AppBar(
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
      body: Center(
        child: Column(
          children: <Widget> [
            new SizedBox(
              height: miscScreenSpacing
            ),
            new LoadingBouncingGrid.circle(
              size: miscScreenIconSize,
              backgroundColor: accentColor,
            )
          ]
        )
      )
    );
  }
}
