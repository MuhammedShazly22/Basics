class HomeModel
{
  late bool status;
  late HomeDatModel data;
  HomeModel.fromjson(Map<String,dynamic> json)
  {
    status = json['status'];
    data =HomeDatModel.fromjson(json['data']) ;
  }
}

class HomeDatModel {

late List<BannerModel>  banners =[] ;
late List<ProductModel> products =[];

  HomeDatModel.fromjson(Map<String,dynamic> json)
  {

    json['banners'].forEach((element){
      banners.add(BannerModel.fromjson(element));
    });

    json['products'].forEach((element){
      products.add(ProductModel.fromjson(element));
    });
  }

}

class BannerModel {

 late int id;
 late String image;

  BannerModel.fromjson(Map<String, dynamic> json) {

    id = json['id'];
    image = json['image'];
  }
}

class ProductModel{

  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic discount;
  late String image;
  late String name;
  late bool in_favorites ;
  late bool in_cart;
  ProductModel.fromjson(Map<String, dynamic> json) {

    id = json['id'];
    image = json['image'];
    price =json['price'];
    old_price =json['old_price'];
    in_favorites =json['in_favorites'];
    in_cart =json['in_cart'];
    name =json['name'];
    discount =json['discount'];

  }
}