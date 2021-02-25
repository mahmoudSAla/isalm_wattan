
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'HomePage.dart';
import 'MoreScreen.dart';


class home_screen_routing extends StatefulWidget {
  @override
  _home_screen_routingState createState() => _home_screen_routingState();
}

class _home_screen_routingState extends State<home_screen_routing> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
              icon: Icon(
                LineIcons.home, size: 20,),
              title: new Text('الرئيسية',style: Constants.PageNavigators,)
          ),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.newspaper_o,
                size: 20,),
              title: new Text('الجريدة',style: Constants.PageNavigators)
          ),
          BottomNavigationBarItem(
              icon: Icon(
                LineIcons.map_marker,  size: 20,),
              title: new Text('الاعداد الشهريه',style: Constants.PageNavigators)
          ),
          BottomNavigationBarItem(
              icon: Icon(
                LineIcons.money,  size: 20,),
              title: new Text('مشروعك وفرص إستثمارية',style: Constants.PageNavigators)
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,size: 20,),
              title: new Text('دراسات واحصائيات و تقارير',style: Constants.PageNavigators)
          ),
          BottomNavigationBarItem(
              icon: Icon(
                LineIcons.reorder,size: 20,),
              title: new Text('More',style: Constants.PageNavigators)
          ),
        ],
        onTap: (index) {
          _incrementTab(index);
          print(index);
        },
      ),
      //drawer: drawer(),
      backgroundColor: Colors.white,
      body: IndexedStack(
        children: <Widget>[
          Homepage(),
          Homepage(),
          Homepage(),
          Homepage(),
          Homepage(),
          Morescreen(),
        ],
        index: _cIndex,
      ),
    ), onWillPop: ()async{
      if(_cIndex == 0)
        return true;
      setState(() {
        _cIndex = 0;
      });
      return false;
    });
  }
}
