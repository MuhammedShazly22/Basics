import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/shopApp/cubit/homeCubit.dart';
import 'package:flutter_projects/shared/componants/componants.dart';
import 'package:flutter_projects/shared/componants/constants.dart';

import '../../../models/shopApp/states/homeStates.dart';

class SettingsScreen extends StatelessWidget{
  var emailcontroller =TextEditingController();
  var namecontroller =TextEditingController();
  var phonecontroller =TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopHomeCubit,shopHomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var model =ShopHomeCubit.get(context).usermodel;
        namecontroller.text=model!.data!.name!;
        emailcontroller.text=model.data!.email!;
        phonecontroller.text=model.data!.phone!;
        return  ConditionalBuilder(
          condition: ShopHomeCubit.get(context).usermodel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (state is shopLoadingUpdateDataUserState )
                    LinearProgressIndicator(),
                  SizedBox(height: 20,),
                  defaultFormText(
                      controller: namecontroller,
                      TextType: TextInputType.name,
                      onSubmitted:(value){
                        print(value);
                      } ,
                      onChanged: (valuue){
                        print(valuue);
                      },
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Name Must Not Be Empty';
                        }
                        return null;
                      },
                      lable: 'Name',
                      prefix: Icons.person),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormText(
                      controller: emailcontroller,
                      TextType: TextInputType.emailAddress,
                      onSubmitted:(value){
                        print(value);
                      } ,
                      onChanged: (valuue){
                        print(valuue);
                      },
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Email Must Not Be Empty';
                        }
                        return null;
                      },
                      lable: 'Email Address',
                      prefix: Icons.email),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormText(
                      controller: phonecontroller,
                      TextType: TextInputType.phone,
                      onSubmitted:(value){
                        print(value);
                      } ,
                      onChanged: (valuue){
                        print(valuue);
                      },
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Phone Number Must Not Be Empty';
                        }
                        return null;
                      },
                      lable: 'Phone',
                      prefix: Icons.call),
                  SizedBox(
                    height: 20.0
                    ),
                  TextButton(

                    onPressed: (){
                      if(formKey.currentState!.validate())
                        {
                          ShopHomeCubit.get(context).UpdateData(
                            name: namecontroller.text,
                              email: emailcontroller.text,
                              phone: phonecontroller.text,);
                        }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: Size.fromHeight(50)),
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                      fontSize: 20.0,
                    ),
                    ),
                  ),
                  SizedBox(
                      height: 20.0
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size.fromHeight(50)),
                    onPressed: (){
                      SignOut(context);
                    },
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()) ,

        );
      },
    );
  }

}