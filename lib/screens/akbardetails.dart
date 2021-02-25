
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:islamwattan/model/htmltags.dart';
import 'package:islamwattan/service/api.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';

class akbardetails extends StatefulWidget {
  int index ;
  akbardetails({this.index});

  @override
  _akbardetailsState createState() => _akbardetailsState();

}

class _akbardetailsState extends State<akbardetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.grey[300],
        actions: [
          IconButton(icon: Icon(Icons.star_border,size: 35,), onPressed: (){},color: Colors.black,padding: EdgeInsets.only(right: 20.0),),
          IconButton(icon: Icon(Icons.share,size: 35,), onPressed: (){},color: Colors.black,padding: EdgeInsets.only(right: 35.0),),
        ],
      ),
      body: FutureBuilder(future: getPostsDetails(widget.index),builder: (context,snapshot){
        var data = snapshot.data ;
        if(snapshot.hasData){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 5.0,),
                      Spacer(),
                      Text("${data['date']}",style: Constants.Pagerefrence,)
                    ],
                  ),
                  // Text(widget.Title,style: Constants.newstitles,),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(future: getMedia(url: data['_links']['wp:featuredmedia'][0]['href']),builder: (context ,snapshot){
                      var imageData = snapshot.data ;
                      if(snapshot.hasData){
                        return Image.network("${imageData['source_url']}") ;
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },),
                    
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child:Text("${data['title']['rendered']}",style: Constants.newstitles),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text("${HtmlTags.removeTag(htmlString: data['content']['rendered'])}",style: Constants.newsdetails,),
                  ),

                  // Container(
                  //   height: 51,
                  //   margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  //   child: Row(
                  //     children: [
                  //       Flexible(
                  //         child: TextField(
                  //           decoration: InputDecoration(
                  //             hintText: "إضافة تعليق",
                  //             hintStyle: Constants.newstitles,
                  //             border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               borderSide: BorderSide.none,
                  //             ),
                  //             fillColor: Color(0xffe6e6ec),
                  //             filled: true,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 15,
                  //       ),
                  //       Container(
                  //           decoration: BoxDecoration(
                  //             color: Color(0xffe6e6ec),
                  //             borderRadius: BorderRadius.circular(9.0),
                  //           ),
                  //           child: IconButton(icon: Icon(LineIcons.commenting_o),)
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },),

      );

  }
}
