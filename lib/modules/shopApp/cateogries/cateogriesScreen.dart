import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/categoriesModel.dart';
import 'package:flutter_projects/models/shopApp/cubit/homeCubit.dart';
import 'package:flutter_projects/models/shopApp/states/homeStates.dart';
import 'package:flutter_projects/shared/componants/componants.dart';

class cateogriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopHomeCubit,shopHomeStates>(
      listener: (context,state) {},
      builder:(context,state) {
        return ListView.separated(
          itemBuilder: (context,index) => buildCatItem(ShopHomeCubit.get(context).categoriesModel!.data.data[index]),
          separatorBuilder: (context,index) =>  Mydivider(),
          itemCount: ShopHomeCubit.get(context).categoriesModel!.data.data.length,
        );
      },

    );
  }

  Widget buildCatItem (DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
        children:[
          Image(image: NetworkImage(model.image),
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            model.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),

        ]
    ),
  );
}