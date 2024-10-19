import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/field_constants.dart';
import 'package:neu_byte_digital/screens/dashboard/screens/views/dashboard_screen.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3) , () {
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
         const DashboardScreen()
        ,));
    },);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width ;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppColor.defaultPadding, right:AppColor.defaultPadding ,
              top: 8 , bottom:AppColor.defaultPadding ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/illustration/congratulation.json'),
                SizedBox(height:height*0.1 ,),
                 Text(FieldConstants.congratulationText,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                ),
               const SizedBox(height: 8,),
                 Text(FieldConstants.congratsHelperText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                ),
                 Text(FieldConstants.congratsHelperText1,
                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                       fontWeight: FontWeight.w500
                   ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
