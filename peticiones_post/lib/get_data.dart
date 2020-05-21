import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:peticiones_post/post.dart';

class Data {
  Future<List<Post>> getPost() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var posts = List<Post>();

    if (response.statusCode == 200) {
      var postsJson = json.decode(response.body);

      for (var postJson in postsJson) {
        posts.add(Post.fromJson(postJson));
      }
    }
    return posts;
  }

  Future<List<Comment>> getComments() async {
    var url = 'https://jsonplaceholder.typicode.com/comments';
    var response = await http.get(url);

    var comments = List<Comment>();

    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);

      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }
}