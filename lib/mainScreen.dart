import "package:flutter/material.dart";

import 'DetailPage.dart';
import 'homeWidget.dart';

class mainScreen extends StatefulWidget {

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  final List<Widget> _children = [HomeWidget() , DetailPage()];
  var _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(onTap: _onItemTapped

        ,
          currentIndex: _selectedIndex,
          backgroundColor: Color(0xfff7faff),type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(""),),
            BottomNavigationBarItem(icon: Icon(Icons.terrain), title: Text(""))
          ],selectedItemColor:   Color(0xff4974a5),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}


