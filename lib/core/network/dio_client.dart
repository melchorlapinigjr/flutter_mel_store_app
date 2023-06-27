import 'package:dio/dio.dart';

import '../../ui/common/constants.dart';

class ApiClient {
  static final dio = createDio();
  static final tokenDio = Dio(BaseOptions(baseUrl: Constants.baseUrl));

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
      responseType: ResponseType.json,
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
