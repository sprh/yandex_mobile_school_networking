import 'dart:async';
import 'dart:convert';

import 'package:github_profile/models/profile.dart';
import 'package:http/http.dart';

class NetworkManager {
  static const _url = "https://api.github.com/users/sprh";

  const NetworkManager();

  Future<GithubProfile> getData() async {
    final uri = Uri.parse(_url);
    final result = await get(uri);
    if (result.statusCode == 200) {
      final body = result.body;
      final jsonString = jsonDecode(body) as Map<String, dynamic>;
      final profile = GithubProfile.fromJson(jsonString);
      return profile;
    }
    throw Exception('Unknown status code');
  }
}
