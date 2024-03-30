import 'package:dio/dio.dart';

import '../../global.dart';
import '../configs/constants.dart';

class HttpHelper {
  late Dio dio;

  static final HttpHelper _instance = HttpHelper._internal();

  factory HttpHelper() {
    return _instance;
  }

  HttpHelper._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    print("hit post method");
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    print("done with header");
   var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
   print("done with post ${response.data["message"]}");
    return response.data;
  }
}
