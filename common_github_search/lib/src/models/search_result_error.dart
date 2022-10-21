class SearchResultError {
  const SearchResultError({
    required this.message,
  });
  final String message;
  static SearchResultError fromJson(Map<String, dynamic> json) {
    return SearchResultError(
      message: json['message'] as String,
    );
  }
}
