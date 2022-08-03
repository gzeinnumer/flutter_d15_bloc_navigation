import 'package:flutter/material.dart';
import 'package:flutter_d15_bloc_navigation/post.dart';

class PostDetailView extends StatelessWidget {
  final Post post;

  const PostDetailView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title.toString()),
      ),
      body: Center(
        child: Text(post.body.toString()),
      ),
    );
  }
}
