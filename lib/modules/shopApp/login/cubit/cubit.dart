import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/shopAppLoginModel.dart';
import 'package:flutter_projects/modules/shopApp/login/states/states.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points/endPoints.dart';

class ShopAppLoginCubit extends Cubit<shopAppLoginStates>{

  ShopAppLoginCubit ():super(shopAppLoginInitialState());
  static ShopAppLoginCubit get(context) => BlocProvider.of(context);

  ShopAppLogin ?loginModel ;

  void userLogin (
    {
    required String email,
    required String password,
    }
      )
  {
    emit(shopAppLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
               'email': email,
              'password':password,
        }
    ).then((value)
    {
      print(value.data);
      loginModel = ShopAppLogin.fromJson(value.data);
      print(loginModel!.data!.token);
      print(loginModel!.status);
      print(loginModel!.message);
      emit(shopAppLoginSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(shopAppLoginErrorState(error.toString()));
    });
  }

  bool ispassword = true;
  IconData suffix = Icons.visibility_outlined ;

  void suffixpressed ()
  {
    ispassword = !ispassword ;
    suffix= ispassword ? Icons.visibility_outlined : Icons.visibility_off ;
    emit(shopAppLoginChangeSuffixState());
  }

}