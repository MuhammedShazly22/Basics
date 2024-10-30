//import 'package:flutter/cupertino.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/models/shopApp/cubit/homeCubit.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';

import '../../modules/newsApp/webview/webviewScreen.dart';
//import 'package:flutter/widgets.dart';

Widget defaultButtom({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function? function,
  required String text,
  double radius = 15.0,

}) =>  Container(
 width: width,
 child: MaterialButton(
   onPressed: (){
     function!();
   },
    child: Text(
            isUpperCase ? text.toUpperCase() : text,
             style: TextStyle(
               color: Colors.white,
      ),
     ),
    ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,

  ),

   );



Widget defaultFormText ({
  required TextEditingController controller,
  required TextInputType TextType,
  required var lable,
  required Function validate,
  required IconData prefix,
   IconData? suffix,
   bool ispassword = false,
  Function? onSubmitted ,
  Function? onChanged ,
  Function? suffixpressed,
  Function? ontab,

}

    ) =>  TextFormField(
  controller:controller ,
  keyboardType: TextType,
  obscureText: ispassword,
  onFieldSubmitted:(s){
    onSubmitted!(s);
  },  //onSubmitted != null? onSubmitted() : null,
  onChanged: (s){
    if (onChanged != null) {
      onChanged(s);
    }
  },            //onChanged != null? onChanged() : null,
  onTap: (){
    if (ontab != null) {
      ontab();
    }
  },
  validator: (value)
  {
    return validate(value);
  },

  decoration: InputDecoration(
    labelText: lable,
    prefixIcon: Icon(prefix),

    suffixIcon: suffix != null?
         IconButton(
           onPressed:()
           {
             suffixpressed!();
             } ,
            icon: Icon(suffix,),
          ): null,
    border: OutlineInputBorder(),
  ),
);


Widget bulidTasksItem (Map model,context) =>Dismissible(
  key: Key (model['id'].toString()),
  onDismissed: (directional){
    AppCubit.get(context).appDeltee(id: model['id']);
  },
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      children: [

        CircleAvatar(
          radius: 40.0,
          child: Text(
              '${model['time']}'
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(''
                  '${model['title']}',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(''
                  '${model['date']}',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
            onPressed:(){
              AppCubit.get(context).appUpdate(status: 'done', id: model['id']);
            },
            icon: Icon(Icons.check_box),
        ),
        IconButton(
          onPressed:(){
            AppCubit.get(context).appUpdate(status: 'archive', id: model['id']);
          },
          icon: Icon(Icons.archive_outlined),
        ),


      ],
    ),
  ),
);



Widget tasksBuilder (

{
  required List<Map> Tasks,
}
    )=>ConditionalBuilder(
  condition:Tasks.length>0 ,
  builder: (context)=>ListView.separated(
    itemBuilder: (context,index)=> bulidTasksItem(Tasks[index],context),
    separatorBuilder: (context,index) => Mydivider(),
    itemCount: Tasks.length,
  ),
  fallback:(context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu
        ),
        Text(
            'No Tasks Yet , Please Add Some Tasks'
        ),
      ],
    ),
  ),
);


Widget builderArticleItem(article,context)=> InkWell(
  onTap: (){
    NavigateTo(context, WebviewScreenview(
      article['url'],
    ),);
  },
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage('https://user-images.githubusercontent.com/930478/56670628-30612d00-6681-11e9-9493-aa19ff0b0819.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}' ,
                    style: Theme.of(context).textTheme.bodyMedium,

                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget Mydivider ()=> Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);
Widget articleItem (list,context, {isSearch =false})=>ConditionalBuilder(
  condition: list.length > 0,
  builder: (context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index) => builderArticleItem(list[index],context),
    separatorBuilder: (context,index) => Mydivider(),
    itemCount: 10,
  ),
  fallback: (context)=> isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

Widget buildListProduct(model, context, {bool isOldPrice =true}) => Padding(
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
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      ShopHomeCubit.get(context).changeFavorites(model.id);
                      // print(model.id);
                    },
                    icon: Icon( (ShopHomeCubit.get(context).favorites[model.id] ?? false) ?
                    Icons.favorite
                        :Icons.favorite_border,
                      color:(ShopHomeCubit.get(context).favorites[model.id] ?? false)
                          ? Colors.red : Colors.grey ,
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



void NavigateTo (context,Widget) => Navigator.push(context,
    MaterialPageRoute(
        builder: (context) => Widget,
    ),
);

void NavigateAndReplace (context,Widget) => Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
        builder: (context) => Widget,
    ),
    (route) {
     return false;
    }

);