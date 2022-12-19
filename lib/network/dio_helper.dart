

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

 static init(){
   dio = Dio(
     BaseOptions(
       baseUrl: 'http://newsapi.org/',
       receiveDataWhenStatusError: true,
//       receiveTimeout: 200,
//       connectTimeout: 200
     )
   );}

   static Future<Response> getData({
     required String url,
     required Map<String,dynamic>? query
   }) async {
      return await dio!.get(
     url,
     queryParameters: query
   );
    }

}