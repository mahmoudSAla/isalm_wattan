
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamwattan/provider/Product_provider.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'screens/home_screen_routing.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffD22F27),
  ));
  runApp(SplashScreen());

}
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child:  MaterialApp(
        theme: ThemeData(
          primaryColor:Color(0xffD22F27),
          accentColor: Color(0xffD22F27),
          cursorColor: Color(0xffD22F27),
          highlightColor: Color(0xffD22F27),

        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreenView(
          home: home_screen_routing(),
          duration: 3000,
          imageSize: 150,
          imageSrc: "assets/images/logo (1).png",
          backgroundColor:Color(0xffffffff),
        ),
      ),

    );
  }
}