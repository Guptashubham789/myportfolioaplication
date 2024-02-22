import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/model/experience-model.dart';
import 'package:portfolio/user/model/services-model.dart';
import 'package:portfolio/user/model/skills-model.dart';

import '../constant/app-constant.dart';
class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: AppConstant.appTextColor),
          backgroundColor: AppConstant.appSecondaryColor,
          title: Text('Experience',style:TextStyle(color:AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily))

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                stream: FirebaseFirestore.instance.collection('workExperience').snapshots()!,
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 1,
                          childAspectRatio: 2.50
                      ),
                      itemBuilder: (context,index){
                        final skillsData=snapshot.data!.docs[index];
                        ExperienceModel skillsModel=ExperienceModel(
                          id: skillsData['id'],
                          cname: skillsData['cname'],
                          cposition: skillsData['cposition'],
                          endDate: skillsData['endDate'],
                          startDate: skillsData['startDate'],
                          learnTechnology: skillsData['learnTechnology'],
                          createdAt: skillsData['createdAt'],
                        );
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: Get.height/2,
                            width: Get.width/1,
                            // color: Colors.greenAccent,
                            child: Card(
                              color: Colors.greenAccent,
                              elevation: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(skillsModel.cname,style: TextStyle(fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold,fontSize: 18,),maxLines: 1,textScaleFactor: 1,),
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
