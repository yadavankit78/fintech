import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/screens/dashboard/widgets/dashboard_card.dart';
import 'package:neu_byte_digital/screens/dashboard/widgets/dashboard_nav_drawer.dart';
import 'package:neu_byte_digital/screens/dashboard/widgets/quick_action_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height ;
    final height = MediaQuery.of(context).size.width ;

    final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60) ,
          child: AppBar(
            title:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ankit" , style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
                Text("NeoBuddy" , style: Theme.of(context).textTheme.bodySmall,),
              ],
            ),
            leading: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100),
                           color: AppColor.primaryColor ,
                         ),
                      child : const  Icon(Icons.person),),
                ),

            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            ),
            actions: [
              IconButton(onPressed: () {
              },
                  icon: SvgPicture.asset('assets/illustration/notification.svg')),
              IconButton(onPressed: () {
              },
                  icon: SvgPicture.asset('assets/illustration/qr_scanner_icon.svg'))
            ],
          )),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             // card carousel
             SizedBox(
               height: height * 0.45,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ListView(
                  scrollDirection: Axis.horizontal,
                   children: [
                     DashboardCard(
                       height: height,
                       width: width ,
                       cardHeaderText1:  Text("Wallet Balance" , style: Theme.of(context).textTheme.bodySmall?.copyWith(
                         color: AppColor.whiteColor.withOpacity(0.7) , fontSize: 14 ,

                       ),),
                       cardHeaderText2:  Text('3200' ,
                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
                             color: AppColor.whiteColor, fontSize: 18,
                             fontWeight: FontWeight.bold),
                       ),
                       cardHeaderImg: ClipRRect(
                           borderRadius: BorderRadius.circular(8),
                           child: Image.asset("assets/images/splash_logo.png" , width: 30 , height: 30,)),

                       cardBodyText1:  Text("Faiz A", style: Theme.of(context).textTheme.bodySmall?.copyWith(
                         color: AppColor.whiteColor.withOpacity(0.7) , fontSize: 14,
                       ),),
                       cardBodyText2: Text("4556 5642 0695" ,
                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
                             color: AppColor.whiteColor , fontSize: 14,
                             fontWeight: FontWeight.w500),
                       ),
                       cardBodyImg:SvgPicture.asset('assets/illustration/wallet_icon.svg' ,
                           width: 30 , height: 30 ),
                      ),
                    const SizedBox(width: 16,),

                     DashboardCard(height: height,
                       width: width ,
                       color1: AppColor.cardGreyColor3,
                       color2: AppColor.cardGreyColor3,
                       cardHeaderText1:   Text("Analytics" ,
                         style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                         color: AppColor.blackColor , fontSize: 18, fontWeight: FontWeight.w600
                       ),),
                       cardHeaderText2:Text("Data driven insights" ,
                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
                             color: AppColor.blackColor , fontSize: 13, fontWeight: FontWeight.w500
                         ),) ,
                        cardBodyText1: SvgPicture.asset('assets/illustration/card_image_icon.svg'),
                        cardBodyImg: const Icon(Icons.arrow_forward ,
                          size: 30,
                          color: AppColor.blackColor,),
                     ),

                   ],
                 ),
               )
             ),
             const SizedBox(height: 8,),
             //  quick actions
             const Align(
               alignment: Alignment.topLeft,
               child: Text(
                 textAlign: TextAlign.start,
                   "Quick Actions"),
             ),

             const SizedBox(height: 8,),
             Container(
               height: height*0.55,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: GridView.count(
                   crossAxisSpacing: 12,
                     mainAxisSpacing: 12,
                     crossAxisCount: 4 ,
                   children: [
                     QuickActionCard(
                       image: SvgPicture.asset("assets/illustration/innovation_icon.svg"),
                       titleText1: "Bill",
                       titleText2: "Payment",
                       color: AppColor.quickCardColor1,
                     ),

                     QuickActionCard(
                       image: SvgPicture.asset("assets/illustration/quick_img2.svg"),
                       titleText1: "Money",
                       titleText2: "Transfer",
                       color: AppColor.quickCardColor2,
                     ),

                     QuickActionCard(
                       image: SvgPicture.asset("assets/illustration/quick_img3.svg"),
                       titleText1: "Micro",
                       titleText2: "ATM",
                       color: AppColor.quickCardColor3,
                     ),

                     QuickActionCard(
                       image: SvgPicture.asset("assets/illustration/quick_img4.svg"),
                       titleText1: "AEPS",
                       titleText2: "",
                       color: AppColor.quickCardColor1,
                     ),

                     QuickActionCard(
                       image: SvgPicture.asset("assets/illustration/quick_img5.svg"),
                       titleText1: "Recharges",
                       titleText2: "",
                       color: AppColor.quickCardColor2,
                     ),

                     QuickActionCard(
                       image: SvgPicture.asset("assets/illustration/quick_img6.svg"),
                       titleText1: "Store",
                       titleText2: "",
                       color: AppColor.quickCardColor3,
                     ),

                     QuickActionCard(
                       image: SvgPicture.asset("assets/illustration/quick_img6.svg"),
                       titleText1: "Aadhaar",
                       titleText2: "Pay",
                       color: AppColor.quickCardColor1,
                     ),


                   ],
                 )
               ),
             ),
           ],
         ),
       ),
     ),


     drawer: const DashboardNavDrawer(),
    );
  }
}
