import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/widget/qualification-widget.dart';

import '../constant/app-constant.dart';
class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppConstant.appSecondaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
      ),
    child: Wrap(
      runSpacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 50.0),
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Shubham Gupta',style: TextStyle(color: AppConstant.appTextColor),),
            subtitle: Text('Version 1.0.1',style: TextStyle(color: AppConstant.appTextColor),),
            leading: CircleAvatar(

              radius: 50.0,
              backgroundColor: AppConstant.appSecondaryColor,
              child: Image.asset('assets/img/shubham.png',height: 50,),
            ),
          ),
        ),
        Divider(
          indent: 10.0,
          endIndent: 10.0,
          thickness: 1.5,
          color: AppConstant.appTextColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            onTap: (){
              Get.to(()=>QualificationWidget());
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Qualification',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.book,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
      ],
    ),
    );
  }
}
