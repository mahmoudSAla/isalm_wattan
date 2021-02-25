import 'package:cached_network_image/cached_network_image.dart';
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class Contact_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تواصل معنا",style:Constants.Pagetitles ,),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: ContactUs(
          image:Image(image: CachedNetworkImageProvider("https://alzeraalyoum.com/wp-content/uploads/2020/02/logo-alzeraalyoum.png"),width: 300,fit: BoxFit.fill,) ,
          cardColor: Colors.white,
          email: "alzeraalyoum@gmail.com",
          companyName: '',
          companyFontSize: 16.0,
          companyColor: Color(0xff855051),
          phoneNumber: '01129944725',
          website: 'http://alzeraalyoum.com/',
          tagLine: '',
          taglineColor: Colors.green,
          facebookHandle: 'https://www.facebook.com/alzeraalyoum',
        ),
      ),
    );
  }
}
