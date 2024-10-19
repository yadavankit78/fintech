
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neu_byte_digital/constant/constant.dart';

class DashboardCard extends StatelessWidget {
  final double height ;
  final double width ;
  final Color color1 ;
  final Color color2 ;
  // header
  final Widget? cardHeaderText1 ;
  final Widget? cardHeaderText2;
  final Widget? cardHeaderImg ;
  // footer
  final Widget? cardBodyText1 ;
  final Widget? cardBodyText2;
  final Widget? cardBodyImg ;

  const DashboardCard({
    super.key, required this.height, required this.width,
    this.color1 = AppColor.cardGreyColor1
    , this.color2 = AppColor.cardGreyColor2,
     this.cardHeaderText1 ,
     this.cardHeaderText2 ,
     this.cardHeaderImg ,
     this.cardBodyText1 ,
     this.cardBodyText2 ,
     this.cardBodyImg ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.38,
      height: height * 0.02,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: [
          color2, color1 ,
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppColor.defaultPadding2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Container(
                     child: cardHeaderText1,
                   ),
                    Container(
                      child: cardHeaderText2,
                    ),

                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: cardHeaderImg,
                    )
                  ],
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: cardBodyText1,
                    ),
                    Container(
                      child: cardBodyText2,
                    ),

                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: cardBodyImg,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
