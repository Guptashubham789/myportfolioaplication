import 'package:flutter/material.dart';
import 'package:portfolio/user/view/main-profile-screen.dart';
import 'package:portfolio/user/widget/qualification-widget.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex=0;
  final List _pages=[
    const MainProfileScreen(),
    const QualificationWidget(),


  ];

  void _selectedPage(int index){
    setState((){
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[50],
        type:BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap:_selectedPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: "Skills",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_connected),
            label: "Follow",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Project",
          ),

        ],
      ),
    );
  }
}
