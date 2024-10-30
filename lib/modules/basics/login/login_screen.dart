import 'package:flutter/material.dart';
//import '../../shared/componants/componants.dart';
import 'package:flutter_projects/shared/componants/componants.dart';

class LoginScreen extends StatelessWidget{
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                
                    Text('Login',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                   TextFormField(
                       controller: emailController,
                       keyboardType:TextInputType.emailAddress,
                       onFieldSubmitted: (value){
                         print(value);
                       },
                         onChanged: (valuue){
                         print(valuue);
                         },
                     validator: (value){
                       if(value!.isEmpty)
                       {
                         return 'your email address most not be empty';
                       }
                       return null;
                     },

                     decoration: InputDecoration(
                       labelText:'Email Address',
                       border: OutlineInputBorder(),
                       prefixIcon: Icon(Icons.email),
                     ),

                   ),
                
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType:TextInputType.visiblePassword,
                      onFieldSubmitted: (value){
                        print(value);
                      },
                      onChanged: (valuue){
                        print(valuue);
                      },
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'your password most not be empty';
                        }
                        return null;
                      },

                      obscureText: true,
                      decoration: InputDecoration(
                        labelText:'password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
                
                    SizedBox(
                      height: 20.0,
                    ),

                   defaultButtom(
                        function: (){
                         if(formkey.currentState!.validate())
                          {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                
                    },
                        text: 'login',
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account',
                
                        ),
                        TextButton(
                            onPressed: (){}
                            , child: Text(
                          'Register Now'
                        ),
                        ),
                      ],
                    ),
                
                
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    
  }
  }


