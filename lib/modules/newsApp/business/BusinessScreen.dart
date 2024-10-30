
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/layout/news/cubit.dart';
import 'package:flutter_projects/layout/news/news_layout.dart';
import 'package:flutter_projects/layout/news/states.dart';
import 'package:flutter_projects/shared/componants/componants.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsAppCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
       var list =NewsAppCubit.get(context).business;
        return articleItem(list,context);
      },

      );

  }

}