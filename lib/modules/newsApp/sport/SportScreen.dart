
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news/cubit.dart';
import '../../../layout/news/states.dart';
import '../../../shared/componants/componants.dart';

class Sportscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsAppCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list =NewsAppCubit.get(context).sports;
        return articleItem(list,context);
      },

    );

  }

}