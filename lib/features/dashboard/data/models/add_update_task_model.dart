// To parse this JSON data, do
//
//     final addUpdateTaskModel = addUpdateTaskModelFromJson(jsonString);

import 'dart:convert';

AddUpdateTaskModel addUpdateTaskModelFromJson(String str) => AddUpdateTaskModel.fromJson(json.decode(str));

String addUpdateTaskModelToJson(AddUpdateTaskModel data) => json.encode(data.toJson());

class AddUpdateTaskModel {
  final String? message;
  final Task? task;

  AddUpdateTaskModel({
    this.message,
    this.task,
  });

  factory AddUpdateTaskModel.fromJson(Map<String, dynamic> json) => AddUpdateTaskModel(
    message: json["message"],
    task: json["task"] == null ? null : Task.fromJson(json["task"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "task": task?.toJson(),
  };
}

class Task {
  final String? taskDetails;
  final int? taskId;
  final String? taskName;
  final DateTime? createdDate;
  final DateTime? updatedDate;

  Task({
    this.taskDetails,
    this.taskId,
    this.taskName,
    this.createdDate,
    this.updatedDate,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    taskDetails: json["task_details"],
    taskId: json["task_id"],
    taskName: json["task_name"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
  );

  Map<String, dynamic> toJson() => {
    "task_details": taskDetails,
    "task_id": taskId,
    "task_name": taskName,
    "created_date": createdDate?.toIso8601String(),
    "updated_date": updatedDate?.toIso8601String(),
  };
}
