import 'package:dio/dio.dart';
import 'package:flt_ulearning/configs/x_configs.dart';
import 'package:flt_ulearning/global.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(seconds: TIME_OUT_DURATION),
      receiveTimeout: const Duration(seconds: TIME_OUT_RECEIVE),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    //--It's like midleware, Proses pada saat kommunikasi ke Server ==> Ada: Request, Response dan Error :
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (response, handler) => handler.next(response),
      onError: (error, handler) {
        print('Error is : ${error.message}');
        ErrorEntity errorInfo = createErrorEntity(error);
        onError(errorInfo);
      },
    ));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();

    if (accessToken.isNotEmpty) {
      headers["Authorization"] = "Bearer $accessToken";
    }

    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options reqOptions = options ?? Options();
    reqOptions.headers = reqOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      reqOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: reqOptions,
    );
    // print(response.data);

    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return 'Exception';

    return 'ErrorEntity{code: $code, message: $message}';
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timeout");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timeout");
    case DioExceptionType.cancel:
      return ErrorEntity(
          code: -1, message: "Request to API server was cancelled");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificate");
    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Bad request");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");
        case 500:
          return ErrorEntity(code: 500, message: "Server internal error");
      }
      return ErrorEntity(
          code: error.response!.statusCode!, message: "Server bad response");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error");
    default:
      return ErrorEntity(code: -1, message: error.message ?? "");
  }
}

void onError(ErrorEntity error) {
  print('error.code -> ${error.code}, error.message -> ${error.message}');
  switch (error.code) {
    case 400:
      print("Server syntax error");
      break;
    case 401:
      print("You are denied to continue");
      break;
    case 500:
      print("Server internal error");
      break;
    default:
      print("Unknown error");
      break;
  }
}
