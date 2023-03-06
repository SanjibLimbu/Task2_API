import 'package:flutter/material.dart';
import 'package:task2/models/posts_model.dart';

import 'package:task2/services/post_service.dart';

class PostsData extends ChangeNotifier {
  Post post = Post();
//get posts
  void getPosts() async {
    post = await PostsService.getPostService();
    notifyListeners();
  }

  //delete post
  void deletePost(int postId) async {
    post = await PostsService.deletePostService(postId);
    notifyListeners();
  }

  //patch post
  void patchPost(int postId, String title, String body) async {
    post = await PostsService.updatePostService(postId, title, body);
    notifyListeners();
  }

  //create post
  void createPost(String title, String body) async {
    post = await PostsService.createPostService(title, body);
    notifyListeners();
  }
}
