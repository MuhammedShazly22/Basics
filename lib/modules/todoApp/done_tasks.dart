import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/shared/componants/componants.dart';
import 'package:flutter_projects/shared/componants/constants.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';
import 'package:flutter_projects/shared/cubit/states.dart';

class DoneTasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var Tasks =AppCubit.get(context).doneTasks;
        return tasksBuilder(Tasks: Tasks);
      },
    );
  }

}