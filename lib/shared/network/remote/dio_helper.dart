import 'package:dio/dio.dart';

class DioHelper
{
  static  Dio? dio;

  static init ()
  {
    dio =Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,


      )
    ) ;
  }
  static Future<Response> getData(
      {
    required String url,
     Map<String, dynamic>? query,
    //required String baseUrl,
        String lang = 'en',
        String? token ,
  }) async
  {
    dio!.options.headers=
    {
      'content-type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio!.get
      (
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic>? data,
        String lang = 'en',
        String? token ,
        //required String baseUrl,
      }) async
  {
    dio!.options.headers=
    {
      'content-type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio!.post
      (
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic>? data,
        String lang = 'en',
        String? token ,
        //required String baseUrl,
      }) async
  {
    dio!.options.headers=
    {
      'content-type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio!.put
      (
      url,
      queryParameters: query,
      data: data,
    );
  }


}