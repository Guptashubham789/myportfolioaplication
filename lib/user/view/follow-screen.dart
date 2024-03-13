import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/app-constant.dart';
class FollowScreen extends StatefulWidget {
  const FollowScreen({super.key});

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  //github
  _launchURL() async {
    final Uri url = Uri.parse('https://github.com/Guptashubham789?tab=repositories');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  //linkdin
  _linkedinURL() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/shubham-gupta789/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  //instagram
  _instagramURL() async {
    final Uri url = Uri.parse('https://www.instagram.com/official__shubham02/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  //facebook
  _facebookURL() async {
    final Uri url = Uri.parse('https://www.facebook.com/profile.php?id=100011889060148');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        title: Text('Follow Me',style: TextStyle(color: AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/img/social.json',height: 200),
            SizedBox(height: 25.0,),
            Center(child: Text("Social Meadia",style: TextStyle(color: AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily),)),
            Divider(),
            Column(
              children:[
                Container(
                  //color: Colors.lightBlueAccent,
                  width: 300,
                child: Card(
                  color: AppConstant.appSecondaryColor,
                  elevation: 10,
                  child:  TextButton(
                      child: Text('Github',style: TextStyle(color: AppConstant.appTextColor,fontSize: 16,fontFamily: AppConstant.appFontFamily),),
                      onPressed: () {
                         _launchURL();
                      }
                  ),
                ),
              ),]
            ),
            Divider(),
            Column(
                children:[
                  Container(
                    //color: Colors.lightBlueAccent,
                    width: 300,
                    child: Card(
                      color:AppConstant.appSecondaryColor,
                      elevation: 10,
                      child:  TextButton(
                          child: Text('Linkedin',style: TextStyle(color: AppConstant.appTextColor,fontSize: 16,fontFamily: AppConstant.appFontFamily),),
                          onPressed: () {
                            _linkedinURL();
                          }
                      ),
                    ),
                  ),]
            ),
            Divider(),
            Column(
                children:[
                  Container(
                    //color: Colors.lightBlueAccent,
                    width: 300,
                    child: Card(
                      color: AppConstant.appSecondaryColor,
                      elevation: 10,
                      child:  TextButton(
                          child: Text('Instagram',style: TextStyle(color: AppConstant.appTextColor,fontSize: 16,fontFamily: AppConstant.appFontFamily),),
                          onPressed: () {
                            _instagramURL();
                          }
                      ),
                    ),
                  ),]
            ),
            Divider(),
            Column(
                children:[
                  Container(
                    //color: Colors.lightBlueAccent,
                    width: 300,
                    child: Card(
                      color: AppConstant.appSecondaryColor,
                      elevation: 10,
                      child:  TextButton(
                          child: Text('Facebook',style: TextStyle(color: AppConstant.appTextColor,fontSize: 16,fontFamily: AppConstant.appFontFamily),),
                          onPressed: () {
                            _facebookURL();
                          }
                      ),
                    ),
                  ),]
            )
          ],
        ),
      ),
    );
  }
}
