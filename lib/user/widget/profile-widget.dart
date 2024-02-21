import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/model/profile-model.dart';

import '../constant/app-constant.dart';
class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('aboutMe').snapshots(),
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
              height: Get.height/5.5,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          // yani ki jo hum document ko fetch karna chah rhe h kya vh empty to nhi hai agr empty hai to yha par hum simple return karvayenge
          if(snapshot.data!.docs.isEmpty){
            return Center(
              child: Text('No profile found!!'),
            );
          }
          //
          if(snapshot.data!=null){
            return Container(
              height: Get.height/1,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  //scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){

                    ProfileModel profileModel=ProfileModel(
                        id: snapshot.data!.docs[index]['id'],
                        img: snapshot.data!.docs[index]['img'],
                        profile: snapshot.data!.docs[index]['profile'],
                        name: snapshot.data!.docs[index]['name'],
                        email: snapshot.data!.docs[index]['email'],
                        mobile: snapshot.data!.docs[index]['mobile'],
                        dob: snapshot.data!.docs[index]['dob'],
                        address: snapshot.data!.docs[index]['address'],
                        createdAt: DateTime.now(),
                    );
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Get.height/3,
                                width: Get.width/1,
                                //color: Colors.greenAccent,
                                decoration: BoxDecoration(
                                  //color: Colors.greenAccent,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                                ),
                                child: Stack(

                                  children: [
                                    Card(
                                      // color: AppConstant.appSecondaryColor,
                                        elevation: 0,
                                        child: Image.network(profileModel.img[0],height: Get.height/2,width: Get.width/1,)),
                                  ],
                                ),
                              ),
                              //skills

                              Center(
                                child: Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text('Hii I am\n${profileModel.name}',style: TextStyle(color:AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold,fontSize: 16),),
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 10,),
                              Center(child: Text('About Me',style: TextStyle(fontFamily: AppConstant.appFontFamily,fontSize: 18,color: AppConstant.appSecondaryColor),)),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,color:AppConstant.appTextColor,fontSize: 14,fontFamily: AppConstant.appFontFamily),),
                                    Text(profileModel.profile)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Email',style: TextStyle(fontWeight: FontWeight.bold,color:AppConstant.appTextColor,fontSize: 14,fontFamily: AppConstant.appFontFamily),),
                                    Text(profileModel.email)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Mobile',style: TextStyle(fontWeight: FontWeight.bold,color:AppConstant.appTextColor,fontSize: 14,fontFamily: AppConstant.appFontFamily),),
                                    Text('+91-${profileModel.mobile}')
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('DOB',style: TextStyle(fontWeight: FontWeight.bold,color:AppConstant.appTextColor,fontSize: 14,fontFamily: AppConstant.appFontFamily),),
                                    Text(profileModel.dob)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Address',style: TextStyle(fontWeight: FontWeight.bold,color:AppConstant.appTextColor,fontSize: 14,fontFamily: AppConstant.appFontFamily),),
                                    Text(profileModel.address)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    );
                  }),
            );
          }

          return Container();
        }
    );
  }
}
