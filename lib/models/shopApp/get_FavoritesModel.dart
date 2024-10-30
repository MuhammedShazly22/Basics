class FavoritesModel {
  late bool status;
  late dynamic message;
  late Data data;


  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']) ;
  }

}

class Data {
  late int currentPage;
  late List<FavData> data;
  late String firstPageUrl;
  late dynamic from;
  late int lastPage;
  late String lastPageUrl;
  Null nextPageUrl;
  late String path;
  late int perPage;
  Null prevPageUrl;
  late dynamic to;
  late int total;



  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <FavData>[];
      json['data'].forEach((v) {
        data.add( FavData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class FavData {
  late int id;
  late Product product;


  FavData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    Product.fromJson(json['product']) ;
  }

}

class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}
