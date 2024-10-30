import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/searchModel.dart';
import 'package:flutter_projects/modules/shopApp/search/States/searchStates.dart';
import 'package:flutter_projects/shared/network/end_points/endPoints.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';

class ShopSearchCubit extends Cubit<shopSerachStates> {

  ShopSearchCubit() :super(shopSearchInitialState());

  static ShopSearchCubit get(context) => BlocProvider.of(context);

  Search? model;

  void search( String text){
    emit(shopLoadingSearchState());
    DioHelper.postData(
        url: SEARCH,
        data: {
          'text': text,
        },
    ).then((value)
    {
      model = Search.fromJson(value.data);
      emit(shopSuccessSearchState());

    }).catchError((error)
    {
      print(error.toString());
      emit(shopErrorSearchState());
    });
  }

}