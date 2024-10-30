import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/searchModel.dart';
import 'package:flutter_projects/modules/shopApp/search/Cubit/searchCubit.dart';
import 'package:flutter_projects/modules/shopApp/search/States/searchStates.dart';
import 'package:flutter_projects/shared/componants/componants.dart';

class searchScreen extends StatelessWidget{

  var searchcontroller =TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit,shopSerachStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    defaultFormText(
                        controller: searchcontroller,
                        TextType: TextInputType.text,
                        onSubmitted:(String text){
                          ShopSearchCubit.get(context).search(text);
                        } ,
                        onChanged: (valuue){
                          print(valuue);
                        },
                        validate: (String value)
                        {
                          if(value.isEmpty)
                          {
                            return 'Enter text to search';
                          }
                          return null;
                        },
                        lable: 'Search',
                        prefix: Icons.search),
                    SizedBox(height: 10,),
                    if(state is shopLoadingSearchState)
                      LinearProgressIndicator(),
                    SizedBox(height: 10,),
                    if(state is shopSuccessSearchState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder:  (context, index) => buildSearchList(ShopSearchCubit.get(context).model!.data.data[index],context, isOldPrice: false),
                        separatorBuilder: (context, index) => Mydivider(),
                        itemCount: ShopSearchCubit.get(context).model!.data.data.length,
                      ),
                    ),

                  ],
                ),
              ),
            )
          );
        },

      ),
    );
  }
  Widget buildSearchList(model, context, {bool isOldPrice =true}) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image),
                fit: BoxFit.cover,
                height: 120.0,
                width: 120.0,

              ),
              if(model.discount!=0 && isOldPrice)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(

                      model.price.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    if(model.discount !=0  && isOldPrice)
                      Text(

                        model.oldPrice.toString(),
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),



                  ],

                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}