import 'package:flutter/material.dart';
import 'package:sample_blog/model/posts.dart';




class CardWidget extends StatelessWidget {

  final Posts post;
  CardWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(post.imageUrl),
    );
  }
}
