import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/layout/news/states.dart';
import 'package:flutter_projects/modules/newsApp/science/ScienceScreen.dart';
import 'package:flutter_projects/modules/newsApp/sport/SportScreen.dart';

import '../../modules/newsApp/business/BusinessScreen.dart';
import '../../shared/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsStates> {

  NewsAppCubit() : super(InitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomIcon =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sport'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),

  ];
List<Widget> screens =
[
   BusinessScreen(),
   Sportscreen(),
   ScienceScreen(),
];

void ChangeIndex(int index){

  currentIndex=index;
  if (index ==1){
    getSport();
  }
  if (index ==2){
    getScience();
  }

  emit(ChangeBotNavBar());
}

List <dynamic> business =[];
List <dynamic> sports =[];
List <dynamic> science =[];
List <dynamic> search =[];



void getBusiness()
{
  emit(NewsGetBusinessLoadingState());
  if (business.length == 0 )
  {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      }
  ).then((value) {

    business = value.data['articles'];
    print (business[0]['title']);
    emit(NewsGetBusinessSuccessState());
  }
  ).catchError((error){
    print(error.toString());
    emit(GetBusinessError(error.toString()));
  });
  } else
  {
    emit(NewsGetBusinessSuccessState());
  }
}


  void getSport()
  {
    emit(NewsGetSportLoadingState());

    if (sports.length == 0 )
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
          }
      ).then((value) {

        sports = value.data['articles'];
        print (sports[0]['title']);
        emit(NewsGetSportSuccessState());
      }
      ).catchError((error){
        print(error.toString());
        emit(GetSportError(error.toString()));
      });
    }else
    {
      emit(NewsGetSportSuccessState());
    }

  }
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0 )
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
          }
      ).then((value) {

        science = value.data['articles'];
        print (science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }
      ).catchError((error){
        print(error.toString());
        emit(GetScienceError(error.toString()));
      });
    } else
    {
      emit(NewsGetScienceSuccessState());
    }


  }


  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());


      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q': '$value',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
          }
      ).then((value) {

        search = value.data['articles'];
        print (search[0]['title']);
        emit(NewsGetSearchSuccessState());
      }
      ).catchError((error){
        print(error.toString());
        emit(GetSearchError(error.toString()));
      });



  }

}