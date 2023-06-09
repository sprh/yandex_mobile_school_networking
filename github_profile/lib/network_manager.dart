import 'dart:async';

import 'package:dio/dio.dart';
import 'package:github_profile/models/profile.dart';

class NetworkManager {
  static const _url = "https://api.github.com/users/sprh";
  late final dio = _createDio;

  Dio get _createDio {
    final dio = Dio();
    dio.interceptors
      ..add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            print("On request: $options");
            handler.next(options);
          },
          onResponse: (options, handler) {
            print("On response: $options");
            handler.next(options);
          },
        ),
      )
      ..add(
        RetryInterceptor(dio),
      );
    return dio;
  }

  NetworkManager();

  Future<GithubProfile> getData() async {
    final result = await dio.get<Map<String, dynamic>>(_url);
    if (result.statusCode == 200) {
      return GithubProfile.fromJson(result.data!);
    }
    throw Exception('Unknown status code');
  }
}

class RetryInterceptor extends Interceptor {
  final Dio _dio;
  RetryInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout) {
      final options = err.requestOptions;
      _dio.request(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        cancelToken: options.cancelToken,
        onSendProgress: options.onSendProgress,
        onReceiveProgress: options.onReceiveProgress,
      );
    }
    super.onError(err, handler);
  }
}
