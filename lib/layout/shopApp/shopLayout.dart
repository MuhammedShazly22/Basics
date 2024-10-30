import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/cubit/homeCubit.dart';
import 'package:flutter_projects/models/shopApp/states/homeStates.dart';
import 'package:flutter_projects/modules/shopApp/login/shopAppLoginScreen.dart';
import 'package:flutter_projects/modules/shopApp/search/searchScreen.dart';
import 'package:flutter_projects/shared/componants/componants.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';

class ShoplayoutScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    var cubit = ShopHomeCubit.get(context);

    return BlocConsumer<ShopHomeCubit,shopHomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('SALLA'),
            actions: [
              IconButton(
                  onPressed: (){
                    NavigateTo(context, searchScreen());
                  },
                  icon: Icon(Icons.search),
              ),
            ],
          ),
          body:
            cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeindex(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label:'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps), label:'Cateogties'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label:'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label:'Settings'),
            ],
          ),
        );
      },

    );
  }

}