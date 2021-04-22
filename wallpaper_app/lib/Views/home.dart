import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/Model/categories_model.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/Model/wallpaper_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategorieModel> categories = new List();
  List<PhotosModel> wallpaper = new List();

  getTrendingWallpaper() async {
    await http.get(
        "https://api.pexels.com/v1/curated?per_page=15&page=1",
        headers: {"Authorization": apiKEY}).then((value) {

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {

        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        wallpaper.add(photosModel);
      });

      setState(() {});
    });
  }


  @override
  void initState() {
    getTrendingWallpaper();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[

          SizedBox(height: 16,),
          Container(
            height: 90,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length ,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return CategoriesTile(
                    title: categories[index].categoriesName,
                    imgUrl: categories[index].imgUrl,
                  );
                }
            ),
          ),
          SizedBox(height: 16,),
          wallpapersList(wallpapers: wallpaper,context: context),

        ],
      )),
    );
  }
}

class CategoriesTile extends StatelessWidget {

  final String imgUrl, title;
  CategoriesTile({@required this.title, @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(children: <Widget> [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover,)),
        Container(
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50, width: 100,
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 15),),
      ),],),
    );
  }
}

