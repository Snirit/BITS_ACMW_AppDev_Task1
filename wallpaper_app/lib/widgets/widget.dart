import 'package:flutter/material.dart';
import 'package:wallpaper_app/Model/wallpaper_model.dart';

Widget brandName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text('Galleria', style: TextStyle(color: Colors.black87,),)
  ],);
}

Widget wallpapersList({List<PhotosModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)),
              ),
            ),
          );
      }).toList(),
    ),
  );
}