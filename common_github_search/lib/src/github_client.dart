import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/search_result.dart';
import 'models/search_result_error.dart';

class GithubClient {
  GithubClient({
    http.Client? httpClient,
    this.baseUrl = 'https://api.github.com/search/repositories?q=',
  }) : this.httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client httpClient;

  Future<SearchResult> search(String term) async {
    final response = await httpClient.get(Uri.parse('$baseUrl$term'));
    final result = json.decode(response.body);
    if (response.statusCode == 200) {
      return SearchResult.fromJson(result);
    } else {
      throw SearchResultError.fromJson(result);
    }
  }
}
