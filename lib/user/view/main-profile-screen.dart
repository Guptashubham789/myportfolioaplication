import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/constant/app-constant.dart';
import 'package:portfolio/user/widget/drawer-widget.dart';
import 'package:portfolio/user/widget/profile-widget.dart';

import '../widget/qualification-widget.dart';
class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({super.key});

  @override
  State<MainProfileScreen> createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        title: Center(child: const Text('Shubham Gupta',style:TextStyle(color:AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily))),

      ),
       drawer: DrawerWidget(),
      body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //SizedBox(he
              // ight: 200,),

              ProfileWidget(),
            ],
          ),
      ),

    );
  }
}
