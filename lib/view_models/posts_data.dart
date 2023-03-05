import 'package:flutter/material.dart';
import 'package:task2/models/posts_model.dart';
import 'package:task2/services/post_service.dart';

class PostsData extends ChangeNotifier {
  List<Posts> posts = [];

  void getPosts() async {
    posts = await PostsService.getPostsService();

    notifyListeners();
  }
}
