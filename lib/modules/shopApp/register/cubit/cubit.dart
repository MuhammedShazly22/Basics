import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/shopAppLoginModel.dart';
import 'package:flutter_projects/modules/shopApp/login/states/states.dart';
import 'package:flutter_projects/modules/shopApp/register/states/states.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points/endPoints.dart';

class ShopAppRegisterCubit extends Cubit<shopAppRegisterStates>{

  ShopAppRegisterCubit ():super(shopAppRegisterInitialState());
  static ShopAppRegisterCubit get(context) => BlocProvider.of(context);

  ShopAppLogin ?loginModel ;

  void userLogin (
    {
    required String email,
    required String password,
    required String phone,
    required String name,
    }
      )
  {
    emit(shopAppRegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
               'email': email,
               'name': name,
               'phone': phone,
              'password':password,
        }
    ).then((value)
    {
      print(value.data);
      loginModel = ShopAppLogin.fromJson(value.data);
      print(loginModel!.data!.token);
      print(loginModel!.status);
      print(loginModel!.message);
      emit(shopAppRegisterSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(shopAppRegisterErrorState(error.toString()));
    });
  }

  bool ispassword = true;
  IconData suffix = Icons.visibility_outlined ;

  void suffixpressed ()
  {
    ispassword = !ispassword ;
    suffix= ispassword ? Icons.visibility_outlined : Icons.visibility_off ;
    emit(shopAppRegisterChangeSuffixState());
  }

}