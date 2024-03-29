import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/user/model/services-model.dart';
import 'package:portfolio/user/model/skills-model.dart';

import '../constant/app-constant.dart';
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: AppConstant.appTextColor),
          backgroundColor: AppConstant.appSecondaryColor,
          title: Text('Services',style:TextStyle(color:AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily))

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Lottie.asset('assets/img/services.json',height: 200),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('services').snapshots(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  //agr koi error hai hmare snapshot me to yh condition chale
                  if(snapshot.hasError){
                    return Center(
                      child: Text('Error'),
                    );
                  }
                  //agr waiting me h to kya return kro
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Container(
                      height: Get.height/4,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  }
                  return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 1,
                          childAspectRatio: 2.90
                      ),
                      itemBuilder: (context,index){
                        final skillsData=snapshot.data!.docs[index];
                        ServicesModel skillsModel=ServicesModel(
                            id: skillsData['id'],
                            name: skillsData['name'],
                        );
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: Get.height/2,
                            width: Get.width/1,
                            // color: Colors.greenAccent,
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(skillsModel.name,style: TextStyle(fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold,fontSize: 16,),maxLines: 1,textScaleFactor: 1,),
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
