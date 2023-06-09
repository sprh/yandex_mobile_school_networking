import 'dart:async';

import 'package:github_profile/models/profile.dart';

class NetworkManager {
  static const _url = "https://api.github.com/users/sprh";

  const NetworkManager();

  Future<GithubProfile> getData() async {
    throw UnimplementedError();
  }
}
