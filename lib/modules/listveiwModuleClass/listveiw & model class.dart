

import 'package:flutter/material.dart';

class usermodel {
  final int id;
  final String name;
  final String phone;
  usermodel({
    required this.id,
    required this.name,
    required this.phone,
  }
);

}

class modelclass extends StatelessWidget{
  List<usermodel> users =[
    usermodel(id: 1, name: 'Mohammed Shazly Rashad', phone: '01155243844'),
    usermodel(id: 2, name: 'Mohammed Shazly Rashad', phone: '01155243844'),
    usermodel(id: 3, name: 'Mohammed Shazly Rashad', phone: '01155243844'),
    usermodel(id: 4, name: 'Mohammed Shazly Rashad', phone: '01155243844'),
    usermodel(id: 5, name: 'Mohammed Shazly Rashad', phone: '01155243844'),
    usermodel(id: 6, name: 'Mohammed Shazly Rashad', phone: '01155243844'),
    usermodel(id: 7, name: 'Mohammed Shazly Rashad', phone: '01155243844'),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'modelClass',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context,idex)  => itemModel(users[idex]),
        separatorBuilder: (context,idex) => Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget itemModel (usermodel user) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text('${user.id}'),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user.name}'),
              SizedBox(
                height: 5.0,
              ),
              Text('${user.phone}'),


            ],
          ),
        ),


      ],
    ),
  );


  // 1- build itme ,
  //2- build list,
  //3- add item to list.
}