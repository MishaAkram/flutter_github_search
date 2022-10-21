class GithubUser{
  const GithubUser({
    required this.login,
    required this.avatarUrl,
  });
  final String login;
  final String avatarUrl;

  static GithubUser fromJson(Map<String, dynamic> json) {
    return GithubUser(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }
}