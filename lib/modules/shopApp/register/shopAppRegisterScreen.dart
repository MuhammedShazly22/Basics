import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/layout/shopApp/shopLayout.dart';
import 'package:flutter_projects/modules/shopApp/login/states/states.dart';
import 'package:flutter_projects/modules/shopApp/register/cubit/cubit.dart';
import 'package:flutter_projects/modules/shopApp/register/states/states.dart';
import 'package:flutter_projects/shared/componants/componants.dart';
import 'package:flutter_projects/shared/componants/constants.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';

import '../login/shopAppLoginScreen.dart';

class shopAppRegisterScreen extends StatelessWidget
{

  var emailcontroller =TextEditingController();
  var namecontroller =TextEditingController();
  var phonecontroller =TextEditingController();

  var passwordlcontroller =TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context)=>ShopAppRegisterCubit(),
        child: BlocConsumer<ShopAppRegisterCubit,shopAppRegisterStates>(
          listener: (context,state){
            if (state is shopAppRegisterSuccessState)
            {
              if (state.loginModel.status!)
              {
                print(state.loginModel.message);
                print(state.loginModel.data!.token);

                CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data!.token,
                ).then((value)
                {
                  token = state.loginModel.data!.token;
                  NavigateAndReplace(context, ShoplayoutScreen()) ;
                });

              } else
              {
                print(state.loginModel.message);
              }
            }
          },
          builder: (context,state){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text(
                          'Register', style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Register  Now To Browse Our Hot Offers', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black45),
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            lable: 'User name',
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
                            lable: 'Email address',
                            prefix: Icons.email),
                        SizedBox(
                          height: 15,
                        ),

                        defaultFormText(
                          controller: passwordlcontroller,
                          TextType: TextInputType.visiblePassword,
                          onSubmitted: (value){
                            print(value);
                            if (formKey.currentState!.validate())
                            {
                              ShopAppRegisterCubit.get(context).userLogin(
                                  email: emailcontroller.text,
                                  password: passwordlcontroller.text,
                                  phone: phonecontroller.text,
                                  name: namecontroller.text,);

                            }
                          },

                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'password Must Not Be Empty';
                            }
                            return null;
                          },
                          lable: 'Password',
                          prefix: Icons.lock,
                          suffix: ShopAppRegisterCubit.get(context).suffix ,
                          ispassword: ShopAppRegisterCubit.get(context).ispassword,

                          suffixpressed: (){
                            ShopAppRegisterCubit.get(context).suffixpressed();
                          },
                        ),
                        SizedBox(
                          height: 30,
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
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! shopAppLoginLoadingState,
                          builder: (context)=> defaultButtom(text: 'REGISTER',
                              isUpperCase: true,
                              function: () {
                                if (formKey.currentState!.validate())
                                {
                                  ShopAppRegisterCubit.get(context).userLogin
                                    (email: emailcontroller.text,
                                      password: passwordlcontroller.text,
                                  phone: phonecontroller.text,
                                  name: namecontroller.text,);

                                }
                              }
                          ),
                          fallback: (context)=> Center(child: CircularProgressIndicator()),

                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },

        ),
      ),

    );
  }

}