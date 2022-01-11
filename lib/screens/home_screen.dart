import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sample_blog/provider/post_provider.dart';
import 'package:sample_blog/screens/add_form.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Consumer(
          builder: (context, ref, child){
            final postData = ref.watch(dataProvider);
            return postData.when(
                data: (data){
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        return Text(data[index].title);
                      });
                },
                error: (err, stack)=> Text('$err'),
                loading: () => Center(child: CircularProgressIndicator(),)
            );
          }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Get.to(() => AddForm(), transition: Transition.leftToRight);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
