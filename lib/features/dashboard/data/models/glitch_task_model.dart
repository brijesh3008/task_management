// To parse this JSON data, do
//
//     final glitchTaskModel = glitchTaskModelFromJson(jsonString);

import 'dart:convert';

List<GlitchTaskModel> glitchTaskModelFromJson(String str) => List<GlitchTaskModel>.from(json.decode(str).map((x) => GlitchTaskModel.fromJson(x)));

String glitchTaskModelToJson(List<GlitchTaskModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GlitchTaskModel {
  final int? taskId;
  final String? taskName;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String? taskDetails;
  final bool? isFavourite;

  GlitchTaskModel({
    this.taskId,
    this.taskName,
    this.createdDate,
    this.updatedDate,
    this.taskDetails,
    this.isFavourite,
  });

  factory GlitchTaskModel.fromJson(Map<String, dynamic> json) => GlitchTaskModel(
    taskId: json["task_id"],
    taskName: json["task_name"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
    taskDetails: json["task_details"],
    isFavourite: json["is_favourite"],
  );

  Map<String, dynamic> toJson() => {
    "task_id": taskId,
    "task_name": taskName,
    "created_date": createdDate?.toIso8601String(),
    "updated_date": updatedDate?.toIso8601String(),
    "task_details": taskDetails,
    "is_favourite": isFavourite,
  };
}
