import 'dart:async';

import 'package:dio/dio.dart';
import 'package:github_profile/models/profile.dart';

class NetworkManager {
  static const _url = "https://api.github.com/users/sprh";

  final _dio = Dio();

  NetworkManager();

  Future<GithubProfile> getData() async {
    final result = await _dio.get<Map<String, dynamic>>(_url);
    if (result.statusCode == 200) {
      return GithubProfile.fromJson(result.data!);
    }
    throw Exception('Unknown status code');
  }
}
