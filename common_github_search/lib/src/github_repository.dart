import 'dart:async';
import 'package:common_github_search/common_github_search.dart';

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