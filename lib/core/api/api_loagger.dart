import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

void logApiResponse({required String url, required Response response, required String type}) {
  final int statusCode = response.statusCode ?? 0;

  Map<String, dynamic>? body;
  try {
    if (response.data is Map<String, dynamic>) {
      body = response.data;
    } else if (response.data is String) {
      body = jsonDecode(response.data);
    } else {
      body = {'message': 'Response data is not in a recognizable format'};
    }
  } catch (e) {
    body = {'message': 'Error parsing response body'};
  }

  if (kDebugMode) {
    print(
        "╔╣ Response ║ $type ║ Status: $statusCode \n"
            "║  $url\n"
            "╚══════════════════════════════════════════════════════════════════════════════════════════╝\n"
            "╔ Body\n"
            "║\n"
    );

    if (body != null) {
      formatAndPrintJson(body, '║    ');
    } else {
      print('║    Body is null or could not be parsed');
    }

    print(
        "║\n"
            "╚══════════════════════════════════════════════════════════════════════════════════════════╝"
    );
  }
}

void formatAndPrintJson(Map<String, dynamic> json, String indent) {
  const encoder = JsonEncoder.withIndent('  ');
  String formatted = encoder.convert(json);
  List<String> lines = formatted.split('\n');
  for (String line in lines) {
    print('$indent$line');
  }
}
