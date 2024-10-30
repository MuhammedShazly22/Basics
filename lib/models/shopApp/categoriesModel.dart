class CategoriesModel
{
  late bool status;
  late CategoriesDataModel data;
  CategoriesModel.fromjson(Map<String, dynamic>json)
  {
    status =json['status'];
    data =CategoriesDataModel.fromjson(json['data']);
  }
}

class CategoriesDataModel
{
  late int current_page;
  late List<DataModel>data=[];

  CategoriesDataModel.fromjson(Map<String, dynamic>json)
  {
    current_page =json['current_page'];
    json['data'].forEach((element){
      data.add(DataModel.fromjson(element));
    });


  }

}

class DataModel
{
  late int id;
  late String name;
  late String image;

  DataModel.fromjson(Map<String, dynamic>json)
  {
    id =json['id'];
    name =json['name'];
    image =json['image'];
  }
}