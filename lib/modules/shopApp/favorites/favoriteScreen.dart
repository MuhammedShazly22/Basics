import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/cubit/homeCubit.dart';
import 'package:flutter_projects/models/shopApp/get_FavoritesModel.dart';
import 'package:flutter_projects/models/shopApp/states/homeStates.dart';
import 'package:flutter_projects/shared/componants/componants.dart';

class favoritesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit,shopHomeStates>(
        listener: (context, state) {},
        builder: (context,state){
          return ConditionalBuilder(
            condition: state is! shopLoadingGetFavoritesState,
            builder: (context)=> ListView.separated(
              itemBuilder:  (context, index) => buildListProduct(ShopHomeCubit.get(context).favoritesModel!.data.data[index].product,context),
              separatorBuilder: (context, index) => Mydivider(),
              itemCount: ShopHomeCubit.get(context).favoritesModel!.data.data.length,
            ),
            fallback:(context) => Center(child: CircularProgressIndicator()),
          );
        },
    );
  }

}
