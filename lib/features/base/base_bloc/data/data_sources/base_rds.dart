import 'package:dio/dio.dart';
import 'package:task_management/core/api/api_services.dart';
import 'package:task_management/core/error/app_exceptions.dart';
import 'package:task_management/features/base/base_bloc/data/models/base_model.dart';

abstract class BaseRDS {
  Future<BaseModel> getBaseData();
}

class BaseRDSImpl extends BaseRDS {
  @override
  Future<BaseModel> getBaseData() async {
    const String url = 'https://reqres.in/api/users?page=1';

    final Response response = await ApiServices.callApi(
      type: ApiType.get,
      url: url,
      methodName: 'getDashboardData',
    );
    if (response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    } else if (response.data['status'] == 'error') {
      throw StatusException(response.data);
    } else {
      throw ServerException();
    }
  }
}
