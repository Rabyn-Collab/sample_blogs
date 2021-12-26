import 'package:dio/dio.dart';
import 'package:sample_blog/api.dart';




class PostService {

 static Future<Response> getPosts() async{
    final dio = Dio();
    try{
      final response =  await dio.get(Api.getPosts);
      return response;
    }catch(err){
      throw err;
    }

 }

}