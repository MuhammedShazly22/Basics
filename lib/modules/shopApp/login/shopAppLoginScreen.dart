
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/modules/shopApp/login/cubit/cubit.dart';
import 'package:flutter_projects/modules/shopApp/login/states/states.dart';
import 'package:flutter_projects/modules/shopApp/register/shopAppRegisterScreen.dart';
import 'package:flutter_projects/shared/componants/constants.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';

import '../../../layout/shopApp/shopLayout.dart';
import '../../../shared/componants/componants.dart';

class shopAppScreen extends StatelessWidget{

  var emailcontroller =TextEditingController();

  var passwordlcontroller =TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool ispassword = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

      ),
      body: BlocProvider(
        create: (context)=>ShopAppLoginCubit(),
        child: BlocConsumer<ShopAppLoginCubit,shopAppLoginStates>(
          listener: (context,state){
            if (state is shopAppLoginSuccessState)
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
                          'Login', style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Login  Now To Browse Our Hot Offers', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black45),
                        ),
                        SizedBox(
                          height: 30,
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
                          controller: passwordlcontroller,
                          TextType: TextInputType.visiblePassword,
                          onSubmitted: (value){
                            print(value);
                            if (formKey.currentState!.validate())
                            {
                              ShopAppLoginCubit.get(context).userLogin(email: emailcontroller.text, password: passwordlcontroller.text);

                            }
                          },
                          // onChanged: (valuue){
                          //   print(valuue);
                          // },
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
                          suffix: ShopAppLoginCubit.get(context).suffix ,
                          ispassword: ShopAppLoginCubit.get(context).ispassword,

                          suffixpressed: (){
                            ShopAppLoginCubit.get(context).suffixpressed();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! shopAppLoginLoadingState,
                          builder: (context)=> defaultButtom(text: 'LOGIN',
                              isUpperCase: true,
                              function: () {
                                if (formKey.currentState!.validate())
                                {
                                  ShopAppLoginCubit.get(context).userLogin(email: emailcontroller.text, password: passwordlcontroller.text);

                                }
                              }
                          ),
                          fallback: (context)=> Center(child: CircularProgressIndicator()),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account ?',),
                            TextButton(
                              onPressed: ()
                              {
                                NavigateTo(context, shopAppRegisterScreen());
                              },
                              child: Text(
                                'Register Now',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              ),

                            ),
                          ],
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