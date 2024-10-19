import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neu_byte_digital/components/buttons/rectangular_btn.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/field_constants.dart';
import 'package:neu_byte_digital/screens/registration/views/congratulation_screen.dart';
import 'package:neu_byte_digital/utils/apputils.dart';

class UploadPanScreen extends StatefulWidget {
  const UploadPanScreen({super.key});

  @override
  State<UploadPanScreen> createState() => _UploadPanScreenState();
}

class _UploadPanScreenState extends State<UploadPanScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late XFile file;
  File? imgPath;
  bool isloading = false ;

  @override
  void initState() {
    super.initState();
  }

  void takePanFromCamera() async {
     isloading = true ;
    await AppUtils().takePictureFromCamera(context).then((value) {
       setState(() {
          if(value != null){
            isloading = false ;
            imgPath = File(value.path);
          }
       });
    },);

  }

  void takePanFromGallery() async {
    isloading = true ;
    print(isloading);
    await AppUtils().takePictureFromGallery(context).then((value) {
      isloading = false ;
      setState(() {
        if (value != null) {
        setState(() {
          imgPath = File(value.path);
          print(isloading);
        });
        }
      });
    },);


  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppColor.defaultPadding,
              right: AppColor.defaultPadding,
              top: 8,
              bottom: AppColor.defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FieldConstants.uploadPan,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      FieldConstants.uploadPanText,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      FieldConstants.uploadHelperText,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColor.errorColor),
                    ),
                    const SizedBox(
                      height: AppColor.defaultPadding2,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // show dialog to pick image from either gallery or camera
                          showOption();
                        },
                        child: Container(
                          height: height * 0.25,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: imgPath != null
                              ?  isloading ? const Center(child: CircularProgressIndicator()): Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.file(
                                    imgPath!,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              :Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/pan_icon.svg",
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      height: AppColor.defaultPadding1,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "PAN",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          children: [
                                            TextSpan(
                                              text: "*",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color:
                                                          AppColor.errorColor),
                                            )
                                          ]),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Upload the front side of PAN',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: AppColor.greyColorText),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppColor.defaultPadding,
            vertical: AppColor.defaultPadding1),
        child: RectangularBtn(
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CongratulationScreen(),
                ));
            // await AppUtils().showProgressIndicator(context);
          },
          textTitle: "Proceed",
        ),
      ),
    );
  }

  Future<void> showOption() async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 200,
            padding: const EdgeInsets.only(left: 16 , right: 16 , top: 20),
            decoration:  BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Column(
                 children: [
                   IconButton(
                       onPressed: () {
                         Navigator.pop(context);
                         takePanFromCamera();
                       },
                       icon: Image.asset('assets/images/camera.png')),
                    Text('Take Picture' ,
                      style: Theme.of(context).textTheme.headlineMedium,) ,
                 ],
               ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          takePanFromGallery();
                        },
                        icon: Image.asset('assets/images/gallery.png')),

                     Text('Select File' ,
                      style: Theme.of(context).textTheme.headlineMedium,),
                  ],
                )
              ],
            ),
          );
      },
    );
  }
}
