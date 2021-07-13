import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:desafio_api/shared/models/post.dart';

class HomeController {
  final baseURL = "http://jsonplaceholder.typicode.com";

  Future getPosts(posts) async {
    var url = Uri.parse(
      '$baseURL/posts',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    }
  }
}
