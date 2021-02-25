
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamwattan/screens/search.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'akeralakbar.dart';
import 'l mglat.dart';



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with AutomaticKeepAliveClientMixin {

  _launchURL() async {
    const url = 'https://www.facebook.com/alzeraalyoum';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLy() async {
    const url = 'https://www.youtube.com/channel/UC3EZCYxOguHudd4bG00PtRA/videos';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(icon: Icon(Icons.search), onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                  }),
                  GestureDetector(
                    onTap:_launchURL ,
                    child:Image.asset("assets/images/icons.png",width: 35.0,) ,
                  ),
                  SizedBox(width: 8.0,),
                  GestureDetector(
                    onTap: _launchURLy ,
                    child:Image.asset("assets/images/icony.png",width: 35.0,) ,
                  ),
                ],
              ),
            )
          ],
          elevation: 5.0,
          title:TyperAnimatedTextKit(
            repeatForever: false,
            pause: Duration(milliseconds: 1000),
            text: [
              "الاسلام الوطن",
            ],

            textStyle: GoogleFonts.amiri(
              fontSize: 25,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),

          bottom: TabBar(
            labelStyle: Constants.Pagesubtitles,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'آخر الأخبار'),
              Tab(text: 'معرض الفديوهات'),
              Tab(text: 'اخر الاعداد'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            akeralakbar(),
            akeralakbar(),
            Maglat(),
          ],
        ),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}