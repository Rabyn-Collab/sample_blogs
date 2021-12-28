import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_blog/provider/post_provider.dart';
import 'package:sample_blog/widgets/card_widget.dart';




class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
        centerTitle: true,
        backgroundColor: Color(0xFFE71E62),
      ),
        body: Consumer(
          builder: (context, ref, child){
            final data = ref.watch(postProvider);
            return  data.length == 0 ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => CardWidget(data[index])
            );

          }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add, size: 30,),
      ),
    );
  }
}
