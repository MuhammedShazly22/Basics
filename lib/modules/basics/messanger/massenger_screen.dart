import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class messanger extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18.0,
              backgroundImage: NetworkImage ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCUFJzP1sV_FTk7ZeG7SI4qag7f-DlTb_ePg&s'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
                'Chats',
              style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
              icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.grey[700],
                child: Icon(
                  Icons.edit,
                  color: Colors.white60,
                  size: 16.0,
                ),
              ),
           ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.grey[700],
                ),

                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        radius: 10.0,
                        child: Icon(
                          Icons.search,
                          color: Colors.white60,
                          size: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                        'Search',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize:17.0 ,
                      ),
                    ),
                  ],
                ),
              ),// search bar
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => BulitStoruItem(),
                    separatorBuilder: (context,index) => SizedBox(
                      width: 15.0,
                    ),
                    itemCount: 5,
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                children: [
                  Container(
                    width: 150.0,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.grey[700],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize:17.0 ,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    width: 150.0,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.grey[700],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Channels',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize:17.0 ,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                ],
              ),// home $ channels
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,idex) => BulitChatItem(),
                  separatorBuilder: (context,idex) => SizedBox(
                    height: 15.0,
                  ),
                  itemCount: 15,
              ),



            ],
          ),
        ),
      ),
    );
  }


Widget BulitChatItem()
{
    return Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCUFJzP1sV_FTk7ZeG7SI4qag7f-DlTb_ePg&s'),
        ),
        SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                'Cristiano Ronaldo Cristiano',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hello pro , ih;ioulfkeke5twtwwwtrshshts',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width:5.0 ,
                      height:5.0 ,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    ' 02:00 pm',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12.0,
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),


      ],
    );

}

Widget BulitStoruItem ()
{
  return Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment:  AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCUFJzP1sV_FTk7ZeG7SI4qag7f-DlTb_ePg&s'),
            ),
            CircleAvatar(
              radius: 9.3,
              backgroundColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2.5,
                end: 2.5,
              ),
              child: CircleAvatar(
                radius: 6.5,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7.0,
        ),
        Text(
          'Cristiano Ronaldo Cristiano',
          style: TextStyle(
            color: Colors.white60,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
}