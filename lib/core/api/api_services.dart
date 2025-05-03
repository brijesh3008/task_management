
import 'package:dio/dio.dart';
import 'package:task_management/core/config/app_network_urls.dart';
import 'package:task_management/core/error/app_exceptions.dart';
import 'package:task_management/core/utils/common_print.dart';
import 'package:task_management/network/dio_interceptor.dart';

import 'api_loagger.dart';

/// [ApiType] Type of APIs which help in select type
/// when call [ApiServices.callApi(type: ApiType.get, url: url)]
enum ApiType { get, post, put, multipartPost }

class ApiServices {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: NetworkUrls.baseUrl,
    ),
  )..interceptors.add(DioInterceptor());

  static Future<Response> callApi({
    required ApiType type,
    required String url,
    dynamic data,

    /// [methodName] is not necessary, it will use
    ///
    /// for showing Method or feature name
    String? methodName,
  }) async {
    /// To print API data into console change [logging] to `true`
    /// also setup interceptor
    // TODO(jenis): set [logging] to `false` in Release mode
    bool logging = true;
    late Response response;


    try{
    if (type == ApiType.get) {
      response = await dio.get(url);
      if (logging) {
        logApiResponse(url: url, response: response, type: 'GET');
      }
    }

    if (type == ApiType.post) {
      response = await dio.post(url, data: data);
      if (logging) {
        logApiResponse(url: url, response: response, type: 'POST');
      }
    }

    if (type == ApiType.put) {
      response = await dio.put(url, data: data);
      if (logging) {
        logApiResponse(url: url, response: response, type: 'PUT');
      }
    }

    if (response.statusCode == 200) {

      return response;
    } else if (response.data['status'] == 'error') {
      throw StatusException(response.data);
    } else {
      throw ServerException();
    }}catch(e){
      logPrint('TRY CATCH ERROR = ${e.toString()}');
    }
    return response;
  }
}
