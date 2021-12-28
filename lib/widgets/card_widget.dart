import 'package:flutter/material.dart';
import 'package:sample_blog/model/posts.dart';




class CardWidget extends StatelessWidget {

  final Posts post;
  CardWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(post.title, style: TextStyle(fontSize: 20, ),),
                Text(post.createdAt)
                ],
              ),
              SizedBox(height: 20,),
              Image.network(post.imageUrl),
              SizedBox(height: 10,),
              Text(post.description.substring(0,10))
            ],
          ),
        ),
      ),
    );
  }
}
