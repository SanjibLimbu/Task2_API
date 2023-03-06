import 'dart:convert';

import 'package:task2/models/posts_model.dart';
import "package:http/http.dart" as http;
import 'package:task2/services/http_service.dart';

class PostsService {
  //get post
  static Future<Post> getPostService() async {
    String url = '${PersistentHttp.baseUrl}posts/1';

    try {
      http.Response response = await PersistentHttp.client.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        return postFromJson(response.body);
      } else {
        return Future.error('Error fetching data get');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //delete post
  static Future<Post> deletePostService(int postId) async {
    String url2 = '${PersistentHttp.baseUrl}posts/$postId';
    try {
      http.Response response = await PersistentHttp.client.delete(
        Uri.parse(url2),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return postFromJson(response.body);
        //api return {}
      } else {
        return Future.error('Error fetching data delete');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //patch post
  static Future<Post> updatePostService(
      int postId, String title, String body) async {
    String url3 = '${PersistentHttp.baseUrl}posts/$postId';

    final post = jsonEncode(
      {
        "title": title,
        "body": body,
      },
    );

    try {
      http.Response response = await PersistentHttp.client.patch(
        Uri.parse(url3),
        body: post,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return postFromJson(response.body);
      } else {
        return Future.error('Error fetching data patch');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  //create post
  static Future<Post> createPostService(String title, String body) async {
    final post = jsonEncode(
      {
        "id": 1,
        "title": title,
        "body": body,
      },
    );

    try {
      http.Response response = await PersistentHttp.client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: post,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 201) {
        return postFromJson(response.body);
      } else {
        return Future.error('Error fetching data post');
      }
    } catch (err) {
      return Future.error(err);
    }
  }
}
