// class PermissionHandlerService{
//
//   static Future getCamera() async {
//     if (!await isPermissionGranted) {
//       final bool isPermissionGranted = await _requestLocationService();
//       if (!isPermissionGranted) {
//         return null;
//       }
//     }
//   }
//
//   static Future<bool> get isPermissionGranted async => await Permission.camera.status.isGranted;
//
//   static Future<bool> _requestCameraPermission() async {
//     var locationServiceStatus = await Permission.camera.status;
//     if (locationServiceStatus.isDenied) {
//       locationServiceStatus = await Permission.camera.request();
//       if (locationServiceStatus.isDenied) {
//         return false;
//       }
//     }
//
//     if (locationServiceStatus.isPermanentlyDenied) {
//       openAppSettings();
//       if (locationServiceStatus.isDenied) {
//         return false;
//       }
//     }
//
//     return true;
//   }
//
// }
