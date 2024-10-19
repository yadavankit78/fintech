import 'package:flutter/cupertino.dart';
import 'package:neu_byte_digital/screens/registration/views/login_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionServices {


  Future<void> requestLocationPermission(BuildContext context) async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      if (await Permission.location.request().isGranted) {
        print('Location permission granted');
      } else {
        // Permission denied, handle accordingly
        print('Location permission denied');
      }
    } else if (status.isPermanentlyDenied) {
      // Handle the case when the permission is permanently denied
      print('Location permission is permanently denied, please enable it in settings');
      // You might want to open app settings here
      openAppSettings();
    } else {
      // Permission already granted
      print('Location permission already granted');
       Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)
       => LoginScreen(),));
    }

  }

}