import 'package:dio/dio.dart';
import 'package:task_management/core/api/api_services.dart';
import 'package:task_management/core/config/app_network_urls.dart';
import 'package:task_management/features/dashboard/data/models/add_update_task_model.dart';
import 'package:task_management/features/dashboard/data/models/glitch_task_model.dart';
import 'package:task_management/features/dashboard/data/models/add_update_params.dart';

abstract class TaskRDS {
  Future<List<GlitchTaskModel>> getGlitchTaskData();

  Future<AddUpdateTaskModel> postTaskDetails(TaskParams params);
}

class TaskRDSImpl extends TaskRDS {
  @override
  Future<List<GlitchTaskModel>> getGlitchTaskData() async {

    final Response response = await ApiServices.callApi(
      type: ApiType.get,
      url: NetworkUrls.glitchTaskUrl,
      methodName: 'getGlitchTask',
    );

    List productList = response.data as List;
    List<GlitchTaskModel> newData = [];
    for (var element in productList) {
      newData.add(GlitchTaskModel.fromJson(element));
    }
    return newData;
  }

  @override
  Future<AddUpdateTaskModel> postTaskDetails(TaskParams params) async {
      final Response response = await ApiServices.callApi(
        type: ApiType.post,
        url: NetworkUrls.postGlitchTaskUrl,
        data: params.toMap(),
        methodName: 'postGlitchTaskUrl',
      );
      return AddUpdateTaskModel.fromJson(response.data);

  }
}
