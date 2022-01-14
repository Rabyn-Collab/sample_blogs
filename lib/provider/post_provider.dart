import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_blog/api.dart';
import 'package:sample_blog/model/posts.dart';



final dataProvider = FutureProvider((ref) => DataProvider().getData());
final postProvider = Provider((ref) => DataProvider());

class DataProvider{

  Future<List<Post>> getData() async{
    try{
      final dio = Dio();
    final  response = await dio.get(Api.getPosts);
    List<Post> posts = (response.data as List).map((e) => Post.fromJson(e)).toList();
    return posts;
    }on DioError catch (e){
      throw e;
    }

  }


  Future<String> addData({Post? newPost}) async{
    try{
      final dio = Dio();
       await dio.post(Api.getPosts,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
        data: {
          "createdAt": newPost!.createdAt,
          "title": newPost.title,
          "description": newPost.description,
          "imageUrl": newPost.imageUrl
      }, );
      return 'success';
    } on DioError catch (e){
      throw e;
    }

  }


  Future<String> updateData(Post newPost, String id) async{
    try{
      final dio = Dio();
      await dio.patch('https://61dbf86f591c3a0017e1a608.mockapi.io/blogs/$id',
        data: {
          "createdAt": newPost.createdAt,
          "title": newPost.title,
          "description": newPost.description,
          "imageUrl": newPost.imageUrl
        },);
      return 'success';
    } on DioError catch (e){
      throw e;
    }

  }



  Future<String> removeData(String id) async{
    try{
      final dio = Dio();
       await dio.get('https://61dbf86f591c3a0017e1a608.mockapi.io/blogs/$id');
       return 'success';
    }on DioError catch (e){
      throw e;
    }

  }


}