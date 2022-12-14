import 'package:equatable/equatable.dart';
import 'package:common_github_search/common_github_search.dart';

abstract class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}
class SearchStateEmpty extends GithubSearchState {}

class SearchStateLoading extends GithubSearchState {}

class SearchStateSuccess extends GithubSearchState{
  const SearchStateSuccess(this.items);
  final List<SearchResultItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: $items }';
}

class SearchStateError extends GithubSearchState{
  const SearchStateError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}