import 'dart:io';

import 'package:task_management/core/config/app_network_urls.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        final bool isValidHost = <String>[NetworkUrls.baseUrl]
            .contains(host); // <-- allow only hosts in array
        return isValidHost;
      });
  }
}
