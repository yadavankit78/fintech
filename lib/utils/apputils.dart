import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neu_byte_digital/constant/constant.dart';

class AppUtils {
  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<XFile?> takePictureFromGallery(BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      print("No Image Selected");
      AppUtils().showSnackBar(context, 'No Image Selected');
    }
    return image;
  }

  Future<XFile?> takePictureFromCamera(BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      print("No Image Selected");
      AppUtils().showSnackBar(context, 'No Image Selected');
    }
    return image;
  }

  Future<void> showProgressIndicator(BuildContext context) async {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.whileColor80,
          title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Please wait... ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SpinKitWave(color: AppColor.primaryColor),
              ],
            ),
          ),
        );
      },
    );
  }
}
