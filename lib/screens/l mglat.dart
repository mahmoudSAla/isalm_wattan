import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamwattan/constants.dart';
class Maglat extends StatefulWidget {
  @override
  _MaglatState createState() => _MaglatState();
}

class _MaglatState extends State<Maglat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context ,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Material(
                elevation: 5.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 176,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 140,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('https://www.islamwattan.org/wp-content/uploads/%D8%BA%D9%84%D8%A7%D9%81-19.jpg',),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(width: 10.00,),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width*0.6,
                                decoration: BoxDecoration(
                                  color: Constants.color,
                                  borderRadius: BorderRadius.circular(20.0),

                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(icon: Icon(Icons.menu_book, color: Colors.white,), onPressed: null),
                                    Text('قراءة',style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 20.0
                                    ),)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: Container(
                                  height: 50.0,
                                  width:MediaQuery.of(context).size.width*0.6,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20.0),

                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(icon: Icon(Icons.arrow_downward_sharp, color: Colors.white,), onPressed: null),
                                      Text('تحميل',style: GoogleFonts.cairo(
                                        color: Colors.white,
                                        fontSize: 20.0
                                      ),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('مجلة شهر رمضات:26/5/2020',style: GoogleFonts.cairo(
                            color: Colors.black
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
