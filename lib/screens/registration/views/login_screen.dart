
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neu_byte_digital/components/buttons/rectangular_btn.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/field_constants.dart';
import 'package:neu_byte_digital/screens/registration/views/otp_verification_screen.dart';
import 'package:neu_byte_digital/screens/registration/widgets/custom_textFormField.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();
  final mobileController = TextEditingController();
  final String countryCode = "+91";

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width ;
     final height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppColor.defaultPadding,
              right:AppColor.defaultPadding ,
              top: 8 ,
              bottom:AppColor.defaultPadding ),
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
                    Text(FieldConstants.verifyMobile ,
                      style: Theme.of(context).textTheme.headlineLarge,) ,
                   const SizedBox(height: 5,),
                    Text(FieldConstants.loginHelperText
                      ,style: Theme.of(context).textTheme.bodySmall,),
                    const SizedBox(height: 8,),
                  ],
                ),
               const SizedBox(height: AppColor.defaultPadding2,),

               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text( FieldConstants.mobileNumber,
                       style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColor.greyColorText),),
                      const SizedBox(height: AppColor.defaultPadding1,),

                     CustomTextFormField(
                         textInputType: TextInputType.number,

                         prefix: Padding(
                           padding: const EdgeInsets.only(left: AppColor.defaultPadding1),
                           child: SizedBox(
                             width: 70,
                             child: Row(
                               children: [
                                 SvgPicture.asset('assets/images/indiaflag.svg'),
                                 Text(countryCode),
                               ],
                             ),
                           ),
                         ),
                         controller:mobileController ,
                         hintText: "Phone Number"),

                   ],
                 ),
               ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      RectangularBtn(onPressed: (){
                        if(_formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              OtpVerificationScreen(phoneNumber: mobileController.text),));
                        // var appSignature =   SmsAutoFill().getAppSignature ;
                        // Future.delayed(const Duration(seconds: 5 , ) ,).whenComplete(() {
                        //    setState(() {
                        //
                        //
                        //    });
                        // },);
                        }
                      } , textTitle: FieldConstants.btnText, ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
