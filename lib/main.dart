import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/custom_theme.dart';
import 'package:theme_provider/drawer.dart';
import 'package:theme_provider/theme_notifier.dart';

void main() => runApp(
  ChangeNotifierProvider<ThemeNotifier>(
    builder: (_) => ThemeNotifier(darkTheme),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Chitr',
      theme: themeNotifier.getTheme(),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        appBar:AppBar(
          title: Text("Theme Changer"),
          centerTitle: true,
          leading: IconButton(
            padding: EdgeInsets.only(left: 20.0),
            onPressed: () {_scaffoldKey.currentState.openDrawer();},
            icon: Icon(Icons.menu,size: 30,),
          ),
        ),
      body: Center(child:
    Text("THEME THAT I LIKE",style: TextStyle(fontSize: 135),)),
      ),
    );
  }
}