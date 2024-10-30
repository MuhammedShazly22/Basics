import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  var emailcont=TextEditingController();
  var passwordcont=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.8,
        leading:  Icon(
          Icons.menu_sharp
        ),
        title:  Text(
          'WELCOME BACK',
          style: TextStyle(
            fontSize: 27.0,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions:  [
          IconButton(
              onPressed: search,
              icon: Icon(
                  Icons.search,

              ),
          ),
        ],
      ),
      body:
            Padding(
              padding:  EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Container(
                     width: double.infinity,
                     child: Text('Welcome Back',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 30.0,
                         fontStyle: FontStyle.italic,
                         color: Colors.black,

                       ),
                     ),
                   ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller:emailcont ,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value)
                      {
                        print(value);
                      },
                      onChanged: (vvaalluuee)
                      {
                        print(vvaalluuee);
                      },
                      decoration: InputDecoration(
                        labelText: 'Your Email Address',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller:passwordcont ,
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (value)
                      {
                        print(value);
                      },
                      onChanged: (vvaalluuee)
                      {
                        print(vvaalluuee);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Your Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.orange,
                      child: MaterialButton(
                          onPressed :()
                          {
                            print(emailcont.text);
                            print(passwordcont.text);
                          },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Do not have account ?',
                        style:TextStyle(
                         // color: Colors.blue,
                        ),
                        ),
                        TextButton(
                            onPressed: (){},
                            child: Text(
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
        );




    }
}

void search (){
  print ('search');
}