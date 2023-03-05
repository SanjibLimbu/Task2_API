import 'package:task2/models/posts_model.dart';
import "package:http/http.dart" as http;
import 'package:task2/services/http_service.dart';

class PostsService {
  static Future<List<Posts>> getPostsService() async {
    String url = '${PersistentHttp.baseUrl}posts';

    try {
      http.Response response = await PersistentHttp.client.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        return postsFromJson(response.body);
      } else {
        return Future.error('Error fetching data');
      }
    } catch (err) {
      return Future.error(err);
    } finally {
      PersistentHttp.client.close();
    }
  }
}
