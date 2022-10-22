import 'dart:async';

import 'github_cache.dart';
import 'github_client.dart';
import 'models/search_result.dart';

class GithubRepository{
  const GithubRepository({
    required this.client,
    required this.cache,
  });
  final GithubClient client;
  final GithubCache cache;

  Future <SearchResult> search(String term) async {
    final cachedResult= cache.get(term);
    if(cachedResult != null){
      return cachedResult;
    }
    final result = await client.search(term);
    cache.set(term, result);
    return result;
  }
}