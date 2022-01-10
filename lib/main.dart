import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_blog/model/posts.dart';
import 'package:sample_blog/screens/home_screen.dart';



void main(){
  runApp(ProviderScope(child: Home()));
}



class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}
