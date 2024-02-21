import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio/user/view/main-profile-screen.dart';
import 'package:portfolio/user/view/splash-screen.dart';

void main() async{
  //mobile auto rotate setting
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp])
  //     .then((_) => runApp(const MyApp()),
  // );
  runApp(const MyApp(

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainProfileScreen(),
    );
  }
}
