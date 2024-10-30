import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/appstate.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<Appstate> {

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> title = [
    'New',
    'Done',
    'Archive',
  ];

  void changeIndex(int index){

    currentIndex=index;
    emit(ChangeNavBar());
  }

  bool isBottomSheetShow = false;
  IconData fabicon = Icons.edit;

  void BottomSheetShow(
  {
   required bool isShow,
   required IconData icon,
})
  {
    isBottomSheetShow = isShow;
    fabicon = icon;

    emit(FloatingBottom());
  }

  var database;
  List<Map> task = [];

  void createDatabase()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print(' Database Created');

        database.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT , date TEXT , time TEXT , status TEXT )')
            .then((value) {
          print('Table Created');
        }).catchError((error) {
          print('Error when created table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getFormDatabase(database).then((value)
        {
          task = value;
          print(task);
          emit(GetData());
        });
        print(' Database Opened');
      },
    ).then((value){
      database = value;

      emit(CreateData());
    });
  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,

  }) async
  {
     await database.transaction((txn) async
    {
      await txn.rawInsert(
          'INSERT INTO task(title,date,time,status) Values("$title"," $date","$time","new")  ')
          .then((value) {

        print('$value inserting successfully');
        emit(InsertData());
        getFormDatabase(database).then((value)
        {
          task = value;
          print(task);
          emit(GetData());
        });

      }).catchError((Error) {
        print('Error when  inserting   ${Error.toString()}');
      });
      return null;
    });
  }

  Future<List<Map>> getFormDatabase(database) async
  {
    return await database.rawQuery('SELECT * FROM task');
  }
}