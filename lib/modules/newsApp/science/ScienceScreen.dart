import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news/cubit.dart';
import '../../../layout/news/states.dart';
import '../../../shared/componants/componants.dart';

class ScienceScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<NewsAppCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list =NewsAppCubit.get(context).science;
        return articleItem(list,context);
      },

    );
  }

}