
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/modules/todoApp/new_tasks.dart';
import 'package:flutter_projects/shared/componants/componants.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';
import 'package:flutter_projects/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';


import '../../shared/componants/constants.dart';

class HomeLayout extends StatelessWidget{


    var ScafoldKey = GlobalKey<ScaffoldState>();
    var FormKey = GlobalKey<FormState>();

    var TitleController =TextEditingController();
    var TimeController =TextEditingController();
    var DateController =TextEditingController();
   @override
    Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext) => AppCubit()..createDatabase(),
      child: BlocConsumer <AppCubit,AppStates >
        (
        listener: (context,state){},
        builder: (context,state){
          AppCubit cubit = AppCubit.get(context);

          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
          return Scaffold(
            key: ScafoldKey,

            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text(cubit.titles[cubit.CurrentIndex]),
            ),
            body: Center
              (child: cubit.screens[cubit.CurrentIndex]),
            floatingActionButton: FloatingActionButton(
              onPressed: () {

                if(cubit.isButtomSheet) {

                  if(FormKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(
                        Title: TitleController.text,
                        Date: DateController.text,
                        Time: TimeController.text,
                    );
             //       insertToDatabase(
               //       Title: TitleController.text,
                 //     Date: DateController.text,
                   //   Time: TimeController.text, ).then( (value)
                    //{
                      //Navigator.pop(context); // لو الشرط اتحقق سيبها مقفولة
                      //isButtomSheet=false;
                      //setState(() {
                      //fabicon= Icons.edit;
                      cubit.changeButtomSheetState(isShow: false, icon: Icons.edit);


                    //});
                  }
                }

                else{

                  ScafoldKey.currentState!.showBottomSheet((context)=>
                      Container(
                        color: Colors.white60,
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: FormKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                defaultFormText(
                                  controller: TitleController,
                                  TextType: TextInputType.text,
                                  lable: 'Task Title',
                                  validate: (value){
                                    if(value?.isEmpty)
                                    {
                                      return 'Title most not be empty';
                                    }
                                    return null;
                                  },

                                  prefix: Icons.title_outlined,
                                ),

                                SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormText(
                                  controller: TimeController,
                                  TextType: TextInputType.datetime,
                                  lable: 'Task Time',
                                  ontab: (){
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then( (value)
                                    {
                                      TimeController.text=value!.format(context).toString();
                                      print(value.format(context));
                                    });
                                  },
                                  validate: (value){
                                    if(value?.isEmpty)
                                    {
                                      return 'Time most not be empty';
                                    }
                                    return null;
                                  },

                                  prefix: Icons.watch_later_outlined,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormText(
                                  controller: DateController,
                                  TextType: TextInputType.datetime,
                                  lable: 'Task Date',
                                  ontab: (){
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2024-10-10'),
                                    ).then( (value)
                                    {
                                      DateController.text=value!.toString();
                                      //print(value.toString());

                                    });
                                  },
                                  validate: (value){
                                    if(value.isEmpty)
                                    {
                                      return 'Date most not be empty';
                                    }
                                    return null;
                                  },

                                  prefix: Icons.calendar_today,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                  ).closed.then((value)
                  {

                    //isButtomSheet=false;
                    // setState(() {
                    //   fabicon=Icons.edit;
                    //       });
                    cubit.changeButtomSheetState(isShow: false, icon: Icons.edit);
                  }
                  );

                  //isButtomSheet=true;
                  //setState(() {
                  //fabicon= Icons.add;
                  //});
                  cubit.changeButtomSheetState(isShow: true, icon: Icons.add);

                }

              },
              child: Icon(
                cubit.fabicon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).CurrentIndex,
              onTap: (index){
                
                AppCubit.get(context).changeIndex(index);  // = CurrentIndex =index;
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'Tasks'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: 'Archive'
                ),


              ],
            ),
          );
        },

      ),
    );

  }


  //Future<String> GetName () async
  //{
 // return 'HHHeellloooo';
 // }




}
// 1. create database
// 2. create table
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database


