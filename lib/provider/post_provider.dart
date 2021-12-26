import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_blog/model/posts.dart';
import 'package:sample_blog/service/post_service.dart';



final postProvider = StateNotifierProvider<PostProvider, List<Posts>>((ref) => PostProvider());

class PostProvider  extends StateNotifier<List<Posts>>{
  PostProvider() : super([]){
    getData();
  }



Future<void> getData() async{
  try{

    final posts = await PostService.getPosts();
     List<Posts> newPosts = (posts.data as List).map((post) => Posts.fromJson(post)).toList();
     state = newPosts;
  }catch(err){
      print(err);
  }
}

}