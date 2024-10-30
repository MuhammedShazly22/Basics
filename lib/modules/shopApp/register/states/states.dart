import 'package:flutter_projects/models/shopApp/shopAppLoginModel.dart';

abstract class shopAppRegisterStates {}

class shopAppRegisterInitialState extends shopAppRegisterStates{}

class shopAppRegisterLoadingState extends shopAppRegisterStates{}

class shopAppRegisterSuccessState extends shopAppRegisterStates{

  final ShopAppLogin loginModel;

  shopAppRegisterSuccessState(this.loginModel);
}

class shopAppRegisterErrorState extends shopAppRegisterStates{
  final String error;
  shopAppRegisterErrorState(this.error);
}

class shopAppRegisterChangeSuffixState extends shopAppRegisterStates{}
