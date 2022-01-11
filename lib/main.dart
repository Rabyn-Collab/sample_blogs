import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sample_blog/screens/home_screen.dart';



void main(){
  runApp(ProviderScope(child: Home()));
}



class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
         debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}
