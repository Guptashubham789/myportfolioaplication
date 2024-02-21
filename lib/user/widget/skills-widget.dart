import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/model/skills-model.dart';

import '../constant/app-constant.dart';
class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: AppConstant.appTextColor),
            backgroundColor: AppConstant.appSecondaryColor,
          title: Text('My Skills',style:TextStyle(color:AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily))

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('skills').snapshots(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 1,
                          childAspectRatio: 1.99
                      ),
                      itemBuilder: (context,index){
                        final skillsData=snapshot.data!.docs[index];
                        SkillsModel skillsModel=SkillsModel(
                            sid: skillsData['sid'],
                            language: skillsData['language'],
                            Knowledge: skillsData['Knowledge']
                        );
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: Get.height/4,
                            width: Get.width/2,
                            // color: Colors.greenAccent,
                            child: Card(
                              color: Colors.greenAccent,
                              elevation: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(skillsModel.language,style: TextStyle(fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold,fontSize: 18,),maxLines: 1,textScaleFactor: 1,),
                                  Text(skillsModel.Knowledge)
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
            ),

          ],
        ),
      ),
    );
  }
}
