import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/pages/home/home_page.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/pages/home/home_page.dart';
import 'package:flutter_latihan_1/pages/home/like_page.dart';
import 'package:flutter_latihan_1/pages/home/profile_page.dart';
import 'package:flutter_latihan_1/pages/home/chat_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget cardButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/card');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/Cart.png',
          width: 60,
        ),
      );
    }

    Widget customBottomNav() {
      // Membrikan Navbar bottom
      return ClipRRect(
        // Memberikan radius bagian atas
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          color: bgColor4,
          // : bgColor4,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          //memberikan lingkuangan
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: bgColor4,
              currentIndex: currentIndex,
              onTap: (value) => setState(
                    () {
                      currentIndex = value;
                    },
                  ),

              // Memberikan warna fixed yang tetap
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Subtract.png',
                      width: 21,
                      color:
                          currentIndex == 0 ? primaryColor : Color(0xff808191),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Chat Icon.png',
                      width: 20,
                      color:
                          currentIndex == 1 ? primaryColor : Color(0xff808191),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icon_like.png',
                      width: 20,
                      color:
                          currentIndex == 2 ? primaryColor : Color(0xff808191),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Profile.png',
                      width: 18,
                      color:
                          currentIndex == 3 ? primaryColor : Color(0xff808191),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        // break;
        case 1:
          return ChatPage();
        // break;

        case 2:
          return LikePage();
        // break;

        case 3:
          return ProfilePage();
        // break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: currentIndex == 0 ? bgColor1 : bgColor3,
        // Floating Action Button ini merupakan memberikan button card
        floatingActionButton: cardButton(),
        // membrikan posisi center
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        body: body());
  }
}
