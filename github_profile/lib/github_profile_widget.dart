import 'package:flutter/material.dart';
import 'package:github_profile/network_manager.dart';

import 'models/profile.dart';

class GithubProfileWidget extends StatefulWidget {
  const GithubProfileWidget({super.key});

  @override
  State<StatefulWidget> createState() => _GithubProfileWidgetState();
}

class _GithubProfileWidgetState extends State<GithubProfileWidget> {
  final networkManager = const NetworkManager();
  GithubProfile? data;

  @override
  void initState() {
    super.initState();
    networkManager.getData().then(
          (value) => setState(() => data = value),
        );
  }

  @override
  Widget build(BuildContext context) {
    final data = this.data;

    if (data == null) {
      return const CircularProgressIndicator();
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(39, 255, 193, 7),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            data.avatarUrl,
            height: 50,
            width: 50,
          ),
          Text(
            data.login,
            style: const TextStyle(fontSize: 25),
          ),
          Text(data.name),
          Text(data.bio),
        ],
      ),
    );
  }
}
