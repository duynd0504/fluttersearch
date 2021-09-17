import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'post.dart';

List<Post> parsePost(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
  return posts;
}

Future<List<Post>> fetchPost() async {
  final reponse =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (reponse.statusCode == 200) {
    return compute(parsePost, reponse.body);
  } else
    throw Exception('Error Loading API');
}
