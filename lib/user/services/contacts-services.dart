import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/view/main-profile-screen.dart';

import '../constant/app-constant.dart';
import '../model/contacts-model.dart';

void sendMessage({
  required BuildContext context,
  required String customerName,
  required String customerEmail,
  required String customerSubject,
  required String customerMessage
}){
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

    //EasyLoading.show(status: "please wait..");
    ContactsModel contactsModel=ContactsModel(
      uId: '',
      username: customerName,
      useremail: customerEmail,
      usersubject: customerSubject,
      userMessage: customerMessage,
      createdOn: DateTime.now(),
    );
    //add data into database firebase firestore
    _firestore
        .collection('contacts')
        .doc()
        .set(
        contactsModel.toMap()
    );
    Get.snackbar(
      "Your Message Send Successfully",
      "Thank you for conatct.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppConstant.appSecondaryColor,
      colorText: AppConstant.appTextColor,
    );
    Get.to(()=>MainProfileScreen());


}