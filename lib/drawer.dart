import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/custom_theme.dart';
import 'package:theme_provider/theme_notifier.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    return Drawer(
        child: Container(
          padding: EdgeInsets.only(
            top: 52,
            left: 32,
            bottom: 8,
          ),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(right: 0, left: 40.0),
                           child: Icon(Icons.brightness_6,size: 150.0)),
                           // logo
                    ],
                  ),
                ],
              ),
              Spacer(),
              SwitchListTile(
                value: themeNotifier.getTheme() == lightTheme ? false:true,
                activeColor: Colors.white70,
                title: Text(
                  "Dark mode",
                  style: TextStyle(color:themeNotifier.getTheme() == lightTheme ? Colors.black:Colors.white, fontSize: 25.0),
                ),
                subtitle: Text(
                  "We know the power of the dark side",
                  style: TextStyle(color:themeNotifier.getTheme() == lightTheme ? Colors.black45:Colors.white30 , fontSize: 15.0),
                ),
                onChanged: (value) {
                  print(value);
                  if(value) {
                    themeNotifier.setTheme(darkTheme);
                  }else{
                    themeNotifier.setTheme(lightTheme);
                  }},
              ),
            ],
          ),
        ));
  }
}

class MenuItem {
  String title;
  IconData icon;
  Color color;
  String widget;
  MenuItem(this.icon, this.title, this.color, this.widget);
}
