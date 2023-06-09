import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(createToJson: false)
class GithubProfile {
  final String login;
  final String name;
  final String bio;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  const GithubProfile({
    required this.login,
    required this.name,
    required this.bio,
    required this.avatarUrl,
  });

  factory GithubProfile.fromJson(Map<String, dynamic> json) =>
      _$GithubProfileFromJson(json);
}
