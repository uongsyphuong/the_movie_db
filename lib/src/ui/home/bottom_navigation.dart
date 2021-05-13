import 'package:flutter/material.dart';
import 'package:the_movie_db/src/ui/forgotPass/forgot_pass_screen.dart';
import 'package:the_movie_db/src/ui/signup/signup_screen.dart';

import 'home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ForgotPassScreen(),
    SignUpScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          child: BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Icon(
                    Icons.home,
                    size: 32,
                  ),
                ),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Icon(
                    Icons.business,
                    size: 32,
                  ),
                ),
                label: 'Hướng dẫn',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Icon(
                    Icons.school,
                    size: 32,
                  ),
                ),
                label: 'Quản trị',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFF019E84),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
