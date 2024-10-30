import 'package:flutter_projects/models/shopApp/shopAppLoginModel.dart';

abstract class shopAppLoginStates {}

class shopAppLoginInitialState extends shopAppLoginStates{}

class shopAppLoginLoadingState extends shopAppLoginStates{}

class shopAppLoginSuccessState extends shopAppLoginStates{

  final ShopAppLogin loginModel;

  shopAppLoginSuccessState(this.loginModel);
}

class shopAppLoginErrorState extends shopAppLoginStates{
  final String error;
  shopAppLoginErrorState(this.error);
}

class shopAppLoginChangeSuffixState extends shopAppLoginStates{}
