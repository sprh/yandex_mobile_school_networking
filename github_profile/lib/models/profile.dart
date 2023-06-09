class GithubProfile {
  final String login;
  final String name;
  final String bio;
  final String avatarUrl;

  const GithubProfile({
    required this.login,
    required this.name,
    required this.bio,
    required this.avatarUrl,
  });

  factory GithubProfile.fromJson(Map<String, dynamic> json) => GithubProfile(
        login: json["login"],
        name: json["name"],
        bio: json["bio"],
        avatarUrl: json["avatar_url"],
      );
}
