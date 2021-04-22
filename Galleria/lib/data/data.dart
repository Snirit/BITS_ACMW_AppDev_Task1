import 'package:wallpaper_app/Model/categories_model.dart';

String apiKEY="563492ad6f9170000100000176c2c175fccd4ef49048d87c28263ebf";

List<CategorieModel> getCategories(){

  List<CategorieModel> categories = new List();
  CategorieModel categoriesModel = new CategorieModel();

  //
  categoriesModel.imgUrl= "https://images.pexels.com/photos/1103970/pexels-photo-1103970.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  categoriesModel.categoriesName = "Abstract";
  categories.add(categoriesModel);
  categoriesModel= new CategorieModel();

  //
  categoriesModel.imgUrl= "https://images.pexels.com/photos/4101555/pexels-photo-4101555.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel= new CategorieModel();

  //
  categoriesModel.imgUrl= "https://images.pexels.com/photos/5944412/pexels-photo-5944412.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  categoriesModel.categoriesName = "Streets";
  categories.add(categoriesModel);
  categoriesModel= new CategorieModel();

  return categories;
}

