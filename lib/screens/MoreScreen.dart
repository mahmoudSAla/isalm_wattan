
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';
import 'Contact_Us.dart';
import 'hmomalflah.dart';

class Morescreen extends StatefulWidget {
  @override
  _MorescreenState createState() => _MorescreenState();
}

class _MorescreenState extends State<Morescreen> {
  List<String>moretitles=[
    "الاعداد الاخيره",
    "الاكثر الروئيه",
    "اخبار دولية",
    "تقارير",
    "تواصل معنا",
  ];
  List<IconData>Iconsdata=[
    LineIcons.optin_monster,
    LineIcons.ship,
    LineIcons.tree,
    LineIcons.bar_chart_o,
    LineIcons.globe,
    LineIcons.line_chart,
    LineIcons.user,
    LineIcons.comments,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       title: Text("More",style: Constants.Pagetitles,),
       centerTitle: true,
     ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                  itemCount: moretitles.length,
                  itemBuilder: (context,index){
                    return Card(
                      shadowColor: Constants.color,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5.0),
                        onTap: (){
                          if(index==6){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>hmomalflah()));
                          }
                          if(index==7){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Contact_us()));
                          }
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text("${moretitles[index]}",style: Constants.More,),
                        leading: Icon(Iconsdata[index],textDirection: TextDirection.ltr,size: 30,),
                      ),
                    );
                  }),
            ],
          ),
        ),

      ),
    );
  }
}