import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/categoriesModel.dart';
import 'package:flutter_projects/models/shopApp/change_favorites.dart';
import 'package:flutter_projects/models/shopApp/get_FavoritesModel.dart';
import 'package:flutter_projects/models/shopApp/homeModel.dart';
import 'package:flutter_projects/models/shopApp/shopAppLoginModel.dart';
import 'package:flutter_projects/models/shopApp/states/homeStates.dart';
import 'package:flutter_projects/modules/shopApp/cateogries/cateogriesScreen.dart';
import 'package:flutter_projects/modules/shopApp/favorites/favoriteScreen.dart';
import 'package:flutter_projects/modules/shopApp/products/productsScreen.dart';
import 'package:flutter_projects/modules/shopApp/settings/SettingsScreen.dart';
import 'package:flutter_projects/shared/componants/constants.dart';
import 'package:flutter_projects/shared/network/end_points/endPoints.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';


class ShopHomeCubit extends Cubit<shopHomeStates>{

  ShopHomeCubit ():super(shopHomeInitialState());
  static ShopHomeCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;

  void changeindex(index){

    currentIndex =index;
    emit(shopChangeBottomNavBarlState());
  }
  List<Widget> bottomScreen =[
    productsScreen(),
    cateogriesScreen(),
    favoritesScreen(),
    SettingsScreen(),
  ];

   Map<int, bool> favorites ={};

    HomeModel? homeModel;
  void getHomeData()
  {
    emit(shopLoadingHomeState());
    //'dsM8MPx2G9xYqGYk1MiXGFqHMZ6l0QEgazDf0rSKBY9mPJgfALdwqEiD80VZwGp5Ln2H3r'
    DioHelper.getData(url: HOME, token: token,)
        .then((value){

      homeModel=HomeModel.fromjson(value.data);
      print(homeModel!.status);

      homeModel!.data.products.forEach((element){
        favorites.addAll({
          element.id : element.in_favorites,
        });
      });
      print(favorites.toString());

      emit(shopSuccessHomeState());
    }).catchError((error){
      print(error.toString());
      emit(shopErrorHomeState());
    });
  }

   CategoriesModel? categoriesModel ;

  void getCategoriesData()
  {

    DioHelper.getData(url: GET_CATEGORIES, ).then((value){

      categoriesModel=CategoriesModel.fromjson(value.data);

        emit(shopSuccessCategoriesState());

    }).catchError((error){
      print(error.toString());

      emit(shopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel ;

  void changeFavorites( int productId)
  {

    favorites[productId]= !(favorites[productId] ?? false) ;
    emit(shopSuccessChangeFavColorState());
    //'dsM8MPx2G9xYqGYk1MiXGFqHMZ6l0QEgazDf0rSKBY9mPJgfALdwqEiD80VZwGp5Ln2H3r',
    DioHelper.postData(url: FAVORITES,
        data:{ 'product_id':productId},
      token: token,
    )
        .then((value){

      changeFavoritesModel=ChangeFavoritesModel.fromjson(value.data);
      print(value.data);
      if(!changeFavoritesModel!.status )
      {
        favorites[productId]= !(favorites[productId] ?? false) ;
      }else {
        GetFav();
      }

          emit(shopSuccessChangeFavoritesState());
    }).catchError((error){

      favorites[productId]= !(favorites[productId] ?? false) ;

      emit(shopErrorChangeFavoritesState());

    });
  }

  FavoritesModel? favoritesModel;

  void GetFav()
  {
    emit(shopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token:token, //'dsM8MPx2G9xYqGYk1MiXGFqHMZ6l0QEgazDf0rSKBY9mPJgfALdwqEiD80VZwGp5Ln2H3r',
    ).then((value){

      favoritesModel=FavoritesModel.fromJson(value.data);

      emit(shopSuccessGetFavoritesState());

    }).catchError((error){
      print(error.toString());

      emit(shopErrorGetFavoritesState());
    });
  }

  ShopAppLogin? usermodel;

  void GetUserData()
  {
    emit(shopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token:token, //'dsM8MPx2G9xYqGYk1MiXGFqHMZ6l0QEgazDf0rSKBY9mPJgfALdwqEiD80VZwGp5Ln2H3r',
    ).then((value){

      usermodel=ShopAppLogin.fromJson(value.data);
      print(usermodel!.data!.name);
      emit(shopSuccessUserDataState(usermodel!));

    }).catchError((error){
      print(error.toString());

      emit(shopErrorUserDataState());
    });
  }


  void UpdateData({
    required String name,
    required String email,
    required String phone,
})
  {
    emit(shopLoadingUpdateDataUserState());

    DioHelper.putData(
      url: UPDATE_USER_DATA,
      token:token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      }, //'dsM8MPx2G9xYqGYk1MiXGFqHMZ6l0QEgazDf0rSKBY9mPJgfALdwqEiD80VZwGp5Ln2H3r',
    ).then((value){

      usermodel=ShopAppLogin.fromJson(value.data);
      print(usermodel!.data!.name);
      emit(shopSuccessUpdateDataUserState(usermodel!));

    }).catchError((error){
      print(error.toString());

      emit(shopErrorUpdateDataUserState());
    });
  }
}