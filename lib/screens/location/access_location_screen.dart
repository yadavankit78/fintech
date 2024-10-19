
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neu_byte_digital/components/buttons/rectangular_btn.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/permission_services.dart';
import 'package:neu_byte_digital/screens/registration/views/login_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessLocationScreen extends StatelessWidget {
  const AccessLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppColor.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Column(
             children: [
               Text("Allow your location" , style: Theme.of(context).textTheme.headlineLarge,) ,
               Text("Please provide your location",style: Theme.of(context).textTheme.bodySmall,),
             ],
           ),

           const SizedBox(height: 40,) ,

            Center(child: SvgPicture.asset("assets/images/access_location.svg")),

            const SizedBox(height: 40,) ,

             Column(
               children: [
                 Text("NeoByt necessitates access to your location during both account creation and application usage. This information is specifically required for payment transactions." ,
                   style: Theme.of(context).textTheme.bodySmall,
                 ) ,

                 const SizedBox(height: 10,) ,

                 Padding(
                   padding: const EdgeInsets.all(8),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('• Neobyt registration necessitates linking with a mobile number designated as the Registered Mobile Number.' ,
                         style: Theme.of(context).textTheme.bodySmall,),
                       SizedBox(height: 5,),

                       Text('• To enable verification, an SMS will be dispatched from the chosen mobile number.' ,
                         style: Theme.of(context).textTheme.bodySmall,),
                       SizedBox(height: 5,),

                       Text('• Please choose the appropriate number for sending the message. Standard SMS charges may be applicable.' ,
                         style: Theme.of(context).textTheme.bodySmall,),
                       SizedBox(height: 5,),
                     ],
                   ),
                 ) ,
               ],
             ),

            Column(
              children: [
                RectangularBtn(onPressed:() {
                PermissionServices().requestLocationPermission(context);
                }, textTitle: "Allow"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
