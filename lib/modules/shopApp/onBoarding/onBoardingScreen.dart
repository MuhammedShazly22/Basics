
import 'package:flutter/material.dart';
import 'package:flutter_projects/modules/shopApp/login/shopAppLoginScreen.dart';
import 'package:flutter_projects/shared/componants/componants.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:flutter_projects/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardinModel {
   final String image;
   final String title;
   final String body;

  BoardinModel({
   required this.image,
   required this.title,
   required this.body,
});
}

class onBoardingScreen extends StatefulWidget
{

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  List<BoardinModel> boarding =[
    BoardinModel(image: 'assets/images/onBoarding.jpg', title: 'On Board 1 Title', body: 'On Board 1 Body'),
    BoardinModel(image: 'assets/images/onBoarding.jpg', title: 'On Board 2 Title', body: 'On Board 2 Body'),
    BoardinModel(image: 'assets/images/onBoarding.jpg', title: 'On Board 3 Title', body: 'On Board 3 Body'),

  ];

  void submit ()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if (value)
        {
          NavigateAndReplace(context, shopAppScreen());
        }
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       actions: [
         TextButton(
             onPressed: (){
               submit();
             },
             child: Text('SKIP',),
         ),
       ],
     ),
     body:Padding(
       padding: const EdgeInsets.all(30.0),
       child: Column(
         children: [
           Expanded(
             child: PageView.builder(
               physics: BouncingScrollPhysics(),
               controller: boardController,
               onPageChanged: (int index){
                 if (index == boarding.length -1)
                 {
                   print('last');
                   setState(() {
                     isLast =true;

                   });
                 } else
                 {
                   print(' not last');
                   setState(() {
                     isLast =false;

                   });
                 }
               },
               itemBuilder: (context,index)=>buildOnBordingItem(boarding[index]),
             itemCount: boarding.length,
             ),
           ),
           SizedBox(height: 40.0,),
           Row(
             children: [
               SmoothPageIndicator(
                   controller: boardController,
                   count: boarding.length,
                 effect: ExpandingDotsEffect(
                   dotColor: Colors.grey,
                   dotHeight: 10,
                   dotWidth: 10,
                   expansionFactor: 4,
                   spacing: 5.0,
                   activeDotColor:defaultColor ,
                 ),
               ),

               Spacer(),
               FloatingActionButton(
                   onPressed: (){
                     if (isLast )
                     {
                       submit();
                     } else
                     {
                       boardController.nextPage(
                           duration: Duration(
                             milliseconds: 750,
                           ),
                           curve: Curves.fastLinearToSlowEaseIn
                       );
                     }
                   },
                   child:
                 Icon(Icons.arrow_forward_ios_sharp),
               ),
             ],
           ),


         ],
       ),
     ),
   );
  }

  Widget buildOnBordingItem(BoardinModel Model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage('${Model.image}')
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${Model.title}',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${Model.body}',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),


    ],
  );
}