import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_blog/api.dart';
import 'package:sample_blog/model/posts.dart';




final postProvider = StateNotifierProvider<PostProvider, List<Posts>>((ref) => PostProvider());

class PostProvider  extends StateNotifier<List<Posts>>{
  PostProvider() : super([]){
    getData();
  }



Future<void> getData() async{
    final dio = Dio();
  try{

    final posts = await dio.get(Api.posts);
     List<Posts> newPosts = (posts.data as List).map((post) => Posts.fromJson(post)).toList();
     state = newPosts;
  }catch(err){
      print(err);
  }
}

  Future<void> addData() async{
    final dio = Dio();
    try{
      final response = await dio.post(Api.posts, data: {
      'createdAt': DateTime.now().toString(),
        'imageUrl': 'https://media.istockphoto.com/photos/tokyo-cityscape-aerial-view-picture-id1278304139?b=1&k=20&m=1278304139&s=170667a&w=0&h=Zj3AqlA67R9saNsuJGXHuj6ROqSn0gc_mtiVbd5BBAo=',
        'title': 'this is testing',
        'description': 'it\s test 12'
      });
      print(response.statusCode);
    }catch(err){
      print(err);
    }
  }



}