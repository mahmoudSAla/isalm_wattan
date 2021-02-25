
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart'as il;
import 'package:islamwattan/model/htmltags.dart';
import 'package:islamwattan/provider/Product_provider.dart';
import 'package:islamwattan/service/api.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'akbardetails.dart';

class  akeralakbar extends StatefulWidget {
  @override
  _akeralakbarState createState() => _akeralakbarState();
}

class _akeralakbarState extends State<akeralakbar> {
  String formatted;
  int _page =1;
  ScrollController _scrollController = new ScrollController() ;
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    var productList = Provider.of<ProductProvider>(context, listen: false);
    productList.resetStreams();
    productList.setLoadingState(LoadMoreStatus.INITAL);
    productList.fetchProducts(_page);
    initializeDateFormatting("ar_SA", null).then((_) {
      var now = DateTime.now();
      var formatter = il.DateFormat.yMMMd('ar_SA');
      print(formatter.locale);
      setState(() {
        formatted = formatter.format(now);
      });

      print(formatted);

    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productList.setLoadingState(LoadMoreStatus.LOADING);
        productList.fetchProducts(++_page);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:Consumer<ProductProvider>(
        builder:(context, producsModel, child) {
        return producsModel.allProducts != null &&
            producsModel.allProducts.length > 0 &&
            producsModel.getLoadMoreStatus() !=
                LoadMoreStatus.INITAL? ListView.builder(
          controller: _scrollController,
          cacheExtent: 10000000,
          itemCount: producsModel.allProducts.length,
          itemBuilder: (context , index){

            String preef =   HtmlTags.removeTag(htmlString: producsModel.allProducts[index].excerpt.rendered);

            return   GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>akbardetails(index: producsModel.allProducts[index].id,)));},
              child: Container(
                child: Card(
                  elevation: 3.0,shadowColor: Colors.green[200],
                  margin: EdgeInsets.all(10.0),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 3,child: Text('${producsModel.allProducts[index].title.rendered}',style: Constants.Pagerefrence,)),
                            Spacer(),
                            Text("${producsModel.allProducts[index].date}",style: Constants.Pagerefrence,)
                          ],
                        ),
                        FutureBuilder(
                          future: getMedia(url: producsModel.allProducts[index].lLinks.wpFeaturedmedia[0].href),
                          builder: (context , snapshot){
                            var imageData = snapshot.data ;
                            if(snapshot.hasData){
                              return Container(
                                height: 135,
                                width: MediaQuery.of(context).size.width,
                                child:FancyShimmerImage(
                                  imageUrl: "${imageData['source_url']}",boxFit: BoxFit.fitWidth,
                                ),
                              );
                            }else{
                              return CircularProgressIndicator() ;
                            }
                          },
                        ),
                        Text('$preef',style: Constants.newstitles,),


                        Align(
                          alignment: Alignment.bottomRight,
                          child:  IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.share,color:Theme.of(context).primaryColor,size: 35,),
                          ),
                        ),
                      ],
                    ),
                  ) ,
                ),
              ),
            );
          },
        ):CircularProgressIndicator();
        },
      )
    );
  }
}
