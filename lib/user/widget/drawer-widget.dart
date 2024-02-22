import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/view/contacts-screen.dart';
import 'package:portfolio/user/view/main-profile-screen.dart';
import 'package:portfolio/user/widget/experience-widget.dart';
import 'package:portfolio/user/widget/my-project-widget.dart';
import 'package:portfolio/user/widget/profile-widget.dart';
import 'package:portfolio/user/widget/qualification-widget.dart';
import 'package:portfolio/user/widget/services-widget.dart';
import 'package:portfolio/user/widget/skills-widget.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 25.0),
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
          indent: 1.0,
          endIndent: 1.0,
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
            title: Text('My Qualification',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.school,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            onTap: (){
              Get.to(()=>SkillsScreen());
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('My Skills',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.star,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            onTap: (){
              Get.to(()=>ExperienceScreen());
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Experience',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.work,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            onTap: (){
              Get.to(()=>ServicesScreen());
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Services',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.design_services,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            onTap: (){
              Get.to(()=>MyProjectScreen());
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Our Project',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.work,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            onTap: (){
              Get.to(()=>ContactsScreen());
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Contacts',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.contacts,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            onTap: (){
              Get.to(()=>SkillsScreen());
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text('Follow Me',style: TextStyle(color: AppConstant.appTextColor),),
            leading: Icon(Icons.social_distance,color: AppConstant.appTextColor,),
            trailing: Icon(Icons.arrow_forward,color: AppConstant.appTextColor,),
          ),
        ),
      ],
    ),
    );
  }
}
