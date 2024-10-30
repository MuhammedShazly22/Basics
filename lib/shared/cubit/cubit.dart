
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/modules/todoApp/archive_tasks.dart';
import 'package:flutter_projects/shared/cubit/states.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/todoApp/done_tasks.dart';
import '../../modules/todoApp/new_tasks.dart';
import '../componants/constants.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);



  int CurrentIndex = 0;
  List<Widget> screens =[
    NewTasks(),
    DoneTasks(),
    ArchiveTasks(),
  ];
  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];

  void changeIndex (int index){

    CurrentIndex =index;
    emit(AppChangeButtonNavBarState());
  }

  late Database database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archiveTasks =[];

  bool isButtomSheet = false;
  IconData fabicon =Icons.edit;

  void changeButtomSheetState (
  {
    required bool isShow,
    required IconData icon,
  }
      )
  {
    isButtomSheet =isShow;
    fabicon = icon;

    emit(AppChangeButtonSheetState());
  }

  void createDatabase ()
  {
    openDatabase(
      'Todo.db',
      version: 1,
      onCreate: (database, version) async
      {
        print('Database Created');
        await database.execute
          ('CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then( (Value)
        {
          print('Table Created');

        }).catchError((Error){

          print('Error when Creating table ${Error.toString()}');
        }
        );

      },
      onOpen: (database)
      {
        getFormDatabase(database);
        print('Database Opned');

      },
    ).then((value){
      database =value;
      emit(AppCreateDatabaseState());
    });

  }

   insertToDatabase ({

    required String Title,
    required String Date,
    required String Time,
  }) async
  {
    await database.transaction((txn) async
    {
      await txn.rawInsert('INSERT INTO Tasks(title,date,time,status) Values("$Title","$Date","$Time","new")  ').then((value)
      {
        print('$value inserting successfully');

        emit(AppInsertDatabaseState());

        getFormDatabase(database);

      }).catchError((Error)
      {
        print('Error when  inserting   ${Error.toString()}');
      });
      return null ;
    });


  }




  void getFormDatabase (database)  {
    newTasks =[];
    doneTasks =[];
    archiveTasks =[];

     database.rawQuery('SELECT * FROM Tasks').then((value){

      // Tasks = value;
       //print(Tasks);

       value.forEach((element){
         if(element['status'] == 'new')
           newTasks.add(element);
         else if(element['status'] == 'done' )
           doneTasks.add(element);
         else  archiveTasks.add(element);




       });

       emit(AppGetDatabaseState());
     });

  }

  void appUpdate (
    {
    required String status,
    required int id,

    }) async
      {

    database.rawUpdate(
        'UPDATE Tasks SET status = ? WHERE id = ?',
        ['$status',  id],
     ).then((value)
    {
          
          getFormDatabase(database);
          emit(AppUpdateDatabaseState());
    });
    }

  void appDeltee (
      {

        required int id,

      }) async
  {

    database
        .rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value){

      getFormDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  bool isDark =false;
  void ChangeAppMode ({bool? fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(ChangeAppModeState());

    }else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }
}