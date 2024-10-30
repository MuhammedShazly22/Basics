import 'package:flutter/material.dart';
import 'package:flutter_projects/shared/componants/componants.dart';



class LoginsScreen extends StatefulWidget
{
  @override
  State<LoginsScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginsScreen> {

  var emailcontroller =TextEditingController();

  var passwordlcontroller =TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                    'Login', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                  ),
                  SizedBox(
                    height: 40,
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
                      lable: 'Email',
                      prefix: Icons.email),
                  SizedBox(
                    height: 15,
                  ),

                  defaultFormText(
                    controller: passwordlcontroller,
                    TextType: TextInputType.visiblePassword,
                   onSubmitted: (value){
                      print(value);
                    },
                    onChanged: (valuue){
                      print(valuue);
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
                    suffix: ispassword ? Icons.visibility : Icons.visibility_off ,
                    ispassword: ispassword,
                    suffixpressed: (){
                      setState(() {
                        ispassword = !ispassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  defaultButtom(text: 'LOGIN',
                      function: () {
                      if (formKey.currentState!.validate())
                        {
                          print(emailcontroller.text);
                          print(passwordlcontroller.text);
                        }
                      }
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dpn\'t have an account ?',),
                      TextButton(onPressed: (){},
                        child: Text('Register Now',),
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