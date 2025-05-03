import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  ///https://developers.google.com/maps/documentation/urls/android-intents#kotlin_12
  static Future<void> navigateTo(String latitude, String longitude) async {
    final Uri uri = Uri(scheme: 'google.navigation', //scheme: 'geo',
        queryParameters: {'q': '$latitude,$longitude'});

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch app which can open map ${uri.toString()}';
    }
  }
}
