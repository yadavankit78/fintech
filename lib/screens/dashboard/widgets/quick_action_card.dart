
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neu_byte_digital/constant/constant.dart';

class QuickActionCard extends StatelessWidget {
  final String titleText1  ;
  final String titleText2 ;
  final Widget? image ;
  final Color? color ;
  const QuickActionCard(
      {super.key,  this.titleText1 = '',
        this.image ,
        this.color = AppColor.quickCardColor1 ,
        this.titleText2 = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8,),
             Container(child: image),
             const SizedBox(height: 5,),
             Text(titleText1),
             Text(titleText2),

          ],
        ),
      ),
    );
  }
}
