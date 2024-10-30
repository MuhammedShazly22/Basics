import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/layout/news/news_layout.dart';
import 'package:flutter_projects/models/shopApp/cubit/homeCubit.dart';
import 'package:flutter_projects/models/shopApp/shopAppLoginModel.dart';
import 'package:flutter_projects/modules/shopApp/login/shopAppLoginScreen.dart';
import 'package:flutter_projects/modules/shopApp/onBoarding/onBoardingScreen.dart';
import 'package:flutter_projects/shared/block_observer.dart';
import 'package:flutter_projects/shared/componants/constants.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';
import 'package:flutter_projects/shared/cubit/states.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';
import 'package:flutter_projects/shared/styles/themes.dart';
import 'package:flutter_projects/tsett.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/news/cubit.dart';
import 'layout/shopApp/shopLayout.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/bmi/bmi calcoulator.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark')?? false;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding')?? false;
  Widget startWidget;
  token = CacheHelper.getData(key: 'token');
  print(token);
  if (onBoarding != null)
    {
      if(token != null) startWidget = ShoplayoutScreen();
      else startWidget = shopAppScreen();
    }else
    {
    startWidget = onBoardingScreen();
  }

  runApp( MyApp(  isDark,startWidget ));

}

class MyApp extends StatelessWidget {
  late final bool isDark ;
  late final Widget startWidget ;
  MyApp(this.isDark, this.startWidget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext) => NewsAppCubit()..getBusiness(),),
        BlocProvider(
          create: (context)=> AppCubit()..ChangeAppMode(
            fromShared: isDark,
          ),
        ),
        BlocProvider(
          create: (context)=> ShopHomeCubit()..getHomeData()..getCategoriesData()..GetFav()..GetUserData(),

        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){} ,
        builder:  (context,state)
        => MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home:startWidget,

        ),
      ),
    );
  }
}