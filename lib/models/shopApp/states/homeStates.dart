import 'package:flutter_projects/models/shopApp/shopAppLoginModel.dart';

abstract class shopHomeStates {}

class shopHomeInitialState extends shopHomeStates{}

class shopChangeBottomNavBarlState extends shopHomeStates{}

class shopLoadingHomeState extends shopHomeStates{}

class shopSuccessHomeState extends shopHomeStates{}

class shopErrorHomeState extends shopHomeStates{}

class shopSuccessCategoriesState extends shopHomeStates{}

class shopErrorCategoriesState extends shopHomeStates{}

class shopSuccessChangeFavoritesState extends shopHomeStates{}

class shopErrorChangeFavoritesState extends shopHomeStates{}

class shopSuccessChangeFavColorState extends shopHomeStates{}

class shopSuccessGetFavoritesState extends shopHomeStates{}

class shopLoadingGetFavoritesState extends shopHomeStates{}

class shopErrorGetFavoritesState extends shopHomeStates{}

class shopSuccessUserDataState extends shopHomeStates{

  final ShopAppLogin loginModel;

  shopSuccessUserDataState(this.loginModel);
}

class shopLoadingUserDataState extends shopHomeStates{}

class shopErrorUserDataState extends shopHomeStates{}

class shopSuccessUpdateDataUserState extends shopHomeStates{

  final ShopAppLogin loginModel;

  shopSuccessUpdateDataUserState(this.loginModel);
}

class shopLoadingUpdateDataUserState extends shopHomeStates{}

class shopErrorUpdateDataUserState extends shopHomeStates{}
