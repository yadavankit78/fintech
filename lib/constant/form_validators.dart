
import 'package:flutter/cupertino.dart';
import 'package:neu_byte_digital/utils/apputils.dart';

class FormValidators {

  // validate pan
 static String? validatePan(String value , {bool isMatch = false}) {
    String p = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
    RegExp regExp = RegExp(p);

    if (!regExp.hasMatch(value)) {
      return 'Pan Number is not valid';
    }
    return null ;
  }

   // validate email
 static String? validateEmail(BuildContext context , String value , {bool isMatch = false}) {
   if (value.isEmpty) {
     AppUtils().showSnackBar(context, "Enter Email Address");
   }
   String p =
       "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
   RegExp regExp = new RegExp(p);

   if (!regExp.hasMatch(value)) {
     return 'Email is not valid';
   }
   // if(regExp.hasMatch(value)){
   //   isMatch = true ;
   //   return 'Looks good';
   // }
   return null;
 }

 // validate name

 static String? validateName( BuildContext context , String value) {
   if (value.isEmpty) {
     AppUtils().showSnackBar(context, 'Please Enter Name');
   }
   return null;
 }

}