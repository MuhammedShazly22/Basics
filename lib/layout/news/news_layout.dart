import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/layout/news/cubit.dart';
import 'package:flutter_projects/layout/news/states.dart';
import 'package:flutter_projects/modules/newsApp/search/searchScreen.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';

import '../../shared/componants/componants.dart';

class NewsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return BlocConsumer <NewsAppCubit,NewsStates >
    (
    listener: (context,state){},
     builder: (context,state) {
       NewsAppCubit cubit = NewsAppCubit.get(context);

           return Scaffold(
     appBar: AppBar(
       title: Text('News App'),
       actions: [
         IconButton(
             onPressed: ()
             {
               NavigateTo(context, Searchscreen());
             },
             icon: Icon(Icons.search)),
         IconButton(
             onPressed: ()
             {
               AppCubit.get(context).ChangeAppMode();
             },
             icon: Icon(
                 Icons.brightness_2_outlined
             ),
         ),
       ],
     ),
     body: cubit.screens[cubit.currentIndex],
     // floatingActionButton:FloatingActionButton(
     //     onPressed: (){
     //       DioHelper.getData(
     //           url: 'v2/top-headlines',
     //           query: {
     //             'country': 'eg',
     //             'category': 'business',
     //             'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
     //           }
     //       ).then((value) {
     //         print(value.data['articles'][0]['title']);
     //       }
     //       ).catchError((error){
     //         print(error.toString());
     //       }
     //       );
     //     },
     //   child: Icon(Icons.add),
     // ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: cubit.currentIndex,
      onTap: (index){
         cubit.ChangeIndex(index);
      },
      items: cubit.bottomIcon,

     )
           );
          },
        );
 }
}