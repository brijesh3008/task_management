import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_management/core/error/app_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiExceptionHandler {
  static Future<void> handle(
      Function apiCall,
      Emitter emit, {
        required Function(String) onFailure,
      }) async {
    try {
      await apiCall();
    } on StatusException catch (e) {
      log(e.message.toString());
      emit(onFailure(e.message['message']));
    } on CacheException catch (e) {
      log(e.toString());
      emit(onFailure('Failed cache'));
    } on ServerException catch (e) {
      log(e.toString());
      emit(onFailure('Failed Server'));
    } on DioError catch (e) {
      log('Dio Error $e');
      emit(onFailure('Failed to fetch data from server.'));
    } catch (e) {
      log('Unknown Error $e');
      emit(onFailure('An unexpected error occurred.'));
    }
  }
}
