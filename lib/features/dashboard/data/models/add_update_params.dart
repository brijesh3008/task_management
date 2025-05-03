import 'package:task_management/core/objects/app_params.dart';

class TaskParams extends LmgParams<TaskParams> {
  final String taskName;
  final String taskDetails;
  final int? taskId;

  TaskParams({
    required this.taskName,
    required this.taskDetails,
     this.taskId,
  });

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['task_details'] = taskDetails;
    map['task_id'] = taskId;
    map['task_name'] = taskName;
    return map;
  }
}
