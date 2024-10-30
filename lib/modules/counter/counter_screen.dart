import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/modules/counter/cubit/cubit.dart';

import 'cubit/states.dart';

class CounterScreen extends StatelessWidget{

  @override


  //int counter =1;

  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext) => CounterCubit(),
      child : BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){},
        builder: (context,state){
         return Scaffold(

             appBar: AppBar(
               backgroundColor: Colors.blue,
               title: Text(
                 'Conter',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
             body: Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton(
                     onPressed: (){
                       CounterCubit.get(context).minus();
                     },
                     child: Text('minus',
                       style: TextStyle(
                         fontSize: 30.0,
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       child: Text(
                         '${CounterCubit.get(context).counter}',
                         style: TextStyle(
                           fontSize: 50.0,
                         ),
                       ),
                     ),
                   ),
                   TextButton(
                     onPressed: (){

                       CounterCubit.get(context).plus();

                     },
                     child: Text('plus',
                       style: TextStyle(
                         fontSize: 30.0,
                       ),
                     ),
                   ),

                 ],
               ),
             )
         );
        },
      )
    );

  }
}