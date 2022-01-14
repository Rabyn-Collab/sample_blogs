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
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(data[index].title, style: TextStyle(fontSize: 20),)
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Image.network(data[index].imageUrl),
                                    Text(data[index].description,  style: TextStyle(fontSize: 17))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                error: (err, stack)=> Text('$err'),
                loading: () => Center(child: CircularProgressIndicator(
                  color: Colors.purple,
                ),)
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
