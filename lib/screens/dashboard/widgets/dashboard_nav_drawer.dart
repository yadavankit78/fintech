import 'package:flutter/material.dart';
import 'package:neu_byte_digital/constant/constant.dart';



class DashboardNavDrawer extends StatelessWidget {
  const DashboardNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 250,
      decoration: const BoxDecoration(
          color: AppColor.whiteColor
      ),
      child: const Column(
        children: [
          DrawerHeader(
              child: Column(
                children: [
                  Icon(Icons.person),
                  Text("Ankit Yadav "),
                ],
              )   ),
        ],
      ),
    ) ;
  }
}
