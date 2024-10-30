//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/appstate.dart';
import 'package:flutter_projects/ccuubbiitt.dart';
import 'package:flutter_projects/shared/componants/componants.dart';
import 'package:sqflite/sqflite.dart';

class Test extends StatelessWidget{





  // int currentIndex = 0;
  // List<String> title = [
  //   'New',
  //   'Done',
  //   'Archive',
  // ];


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer <AppCubit,Appstate> (
        listener: (context,state){
          if (state is InsertData)
          {
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          AppCubit cubit = AppCubit.get(context);
          return  Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text(cubit.title[cubit.currentIndex]),
            ),
            // body: ConditionalBuilder(
            // condition:task.length > 0,
            // builder: (context) =>screens[currentIndex],
            // fallback: Center (child: CircularProgressIndicator()),              ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShow) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );
                    // insertToDatabase(
                    //     title: titleController.text,
                    //     time: timeController.text,
                    //     date: dateController.text
                    // ).then((value) {
                    //   Navigator.pop(context);
                    //   //isBottomSheetShow = false;
                    //   cubit.BottomSheetShow(isShow: false, icon: Icons.edit);
                    //   // setState(() {
                    //   //   fabicon = Icons.edit;
                    //   // });
                    // });
                  }
                } else {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) =>
                        Container(
                          width: double.infinity,
                          color: Colors.white60,
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  defaultFormText(
                                    controller: titleController,
                                    TextType: TextInputType.text,
                                    onChanged: (value) {
                                      return value;
                                    },
                                    ontab: () {

                                    },
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'title must not be empty';
                                      }
                                      return null;
                                    },
                                    lable: 'Task title',
                                    prefix: Icons.title,

                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormText(
                                    controller: timeController,
                                    TextType: TextInputType.datetime,
                                    ontab: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        timeController.text =
                                            value!.format(context).toString();
                                        print(value.format(context));
                                      });
                                    },
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'time must not be empty';
                                      }
                                      return null;
                                    },
                                    lable: 'Time title',
                                    prefix: Icons.watch_later_outlined,

                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormText(
                                    controller: dateController,
                                    TextType: TextInputType.datetime,
                                    ontab: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2024-10-10'),
                                      ).then((value) {
                                        dateController.text = value!.toString();
                                        print(value.toString());
                                      });
                                    },
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'Date must not be empty';
                                      }
                                      return null;
                                    },
                                    lable: 'Date title',
                                    prefix: Icons.calendar_today,

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                  ).closed.then((value)
                  {
                    cubit.BottomSheetShow(isShow: false, icon: Icons.edit);

                    //isBottomSheetShow = false;
                    // setState(() {
                    //   fabicon = Icons.edit;
                    // });
                  });

                  cubit.BottomSheetShow(isShow: true, icon: Icons.add_circle_outline);

                  // isBottomSheetShow = true;
                  // setState(() {
                  //   fabicon = Icons.add_circle_outline;
                  // });
                }
              },
              child: Icon(
                cubit.fabicon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu,),
                  label: 'Tasks',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline,),
                  label: 'Done',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined,),
                  label: 'Archive',

                ),
              ],
            ),
          );
        },
      ),
    );
  }



}

// @override
//  void initState() {
//     super.initState();
//     createDatabase();




