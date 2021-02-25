import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islamwattan/model/posts.dart';
int page = 0 ;
List<posts>postsdata;
getPosts(ScrollController _scrollController) async {
  String myUrl = "https://islamwattan.org/wp-json/wp/v2/posts?per_page=3&page =$page";
  http.Response response = await http.get(myUrl);
  var data = json.decode(response.body);
  _scrollController.addListener(() async {
    print(_scrollController.position.pixels);
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      myUrl = "https://islamwattan.org/wp-json/wp/v2/posts?per_page=3&page =${page++}";
      http.Response response = await http.get(myUrl);
      data = json.decode(response.body);
      print(page);
    }
  });
  return data;
}
Future<List<posts>> getposts(
    {int pageNumber,
      int pageSize,
      String strSearch,
      int categoryId,
      String sortBy,
      String sortOrder = "asc"}) async {
  String parameter = "";
  if (strSearch != null) {
    parameter += "&search=$strSearch";
  }
  if (pageSize != null) {
    parameter += "&per_page=$pageSize";
  }
  if (pageNumber != null) {
    parameter += "&page=$pageNumber";
  }
  if (sortBy != null) {
    parameter += "&orderby=$sortBy";
  }
  if (sortOrder != null) {
    parameter += "&order=$sortOrder";
  }
  final response = await http.get(
      'https://islamwattan.org/wp-json/wp/v2/posts?${parameter.toString()}&categories[]=6');

  if (response.statusCode == 200) {
    var data = json.decode(response.body) as List;
    postsdata = data.map<posts>((json) => posts.fromJson(json)).toList();
  }
  return postsdata;
}
getPostsDetails(int id)async{
  String myUrl = "https://islamwattan.org/wp-json/wp/v2/posts/$id";
  http.Response response = await http.get(myUrl);
  var data = json.decode(response.body);
  return data;
}
getcategories()async{
  String url = "https://www.islamwattan.org/wp-json/wp/v2/categories?parent=0" ;
  http.Response response = await http.get(url);
  var data = json.decode(response.body);
  print(data);
  return data ;
}
getComments()async{
  String url = "" ;
  http.Response response = await http.get(url);
  var data = json.decode(response.body);
  print(data);
  return data ;
}
getMedia({String url})async{
  http.Response response = await http.get(url);
  var data = json.decode(response.body);
  return data ;
}