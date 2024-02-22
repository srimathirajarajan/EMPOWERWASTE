// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, sort_child_properties_last, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, unused_import, use_super_parameters, prefer_typing_uninitialized_variables, unused_local_variable, deprecated_member_use, sized_box_for_whitespace, duplicate_import, prefer_const_constructors_in_immutables

import 'package:bootcamp/features/user_auth/presentation/pages/common.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/map/map.dart';
import 'package:bootcamp/signin.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/category.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/login_page.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/notify.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/scanner.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/settings.dart';
import 'package:hexcolor/hexcolor.dart';

final bottomNavIndexProvider = StateProvider((ref) => 0);

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#ffebe3'),
        appBar: _appBar(context),
        drawer: _drawer(
            context,
            FirebaseAuth.instance.currentUser?.email ??
                'arjunfree256@gmail.com'),
        body: Consumer(builder: (context, ref, child) {
          final currentIndex = ref.watch(bottomNavIndexProvider);
          return IndexedStack(
            index: currentIndex,
            children: [PageScanner(), MapSample(), ProfilePage()],
          );
        }),
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) {
            final currentIndex = ref.watch(bottomNavIndexProvider);
            return Theme(
                data: ThemeData(
                  canvasColor: HexColor('#ea6c69'),
                  primaryColor: Colors.black12,
                ),
                child: BottomNavigationBar(
                    currentIndex: currentIndex,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.black45,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.map_outlined), label: 'Map'),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_2_outlined),
                        label: 'Profile',
                      ),
                    ],
                    onTap: (value) {
                      ref
                          .read(bottomNavIndexProvider.notifier)
                          .update((state) => value);
                    }));
          },
        ));
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        backgroundColor: HexColor('#ea6c69'),
        title: Padding(
          padding: EdgeInsets.only(left: 70),
          child: SafeArea(
            child: Text(
              'EmpowerWaste',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }

  Drawer _drawer(BuildContext context, String profile) {
    String firstLetter = profile.isNotEmpty ? profile[0].toUpperCase() : '';

    return Drawer(
      backgroundColor: HexColor('#ffebe3'),
      child: Container(
        height: double.infinity,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: HexColor('#ea6c69'),
              ),
              child: Row(children: [
                SizedBox(width: 20),
                Column(
                  children: [
                    SizedBox(height: 15),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Text(
                        firstLetter,
                        style: TextStyle(
                          color: HexColor('#ea6c69'),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profile,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
            ),
            ListTile(
              leading: GestureDetector(
                child: Icon(
                  Icons.question_mark_rounded,
                  size: 38,
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => GetHelp(),
                )),
              ),
              title: GestureDetector(
                child: Text(
                  "Get Help",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => GetHelp(),
                )),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                size: 38,
              ),
              title: Text("About As"),
              textColor: Colors.black,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HousePage(),
              )),
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                size: 38,
              ),
              title: Text("Contact Us"),
              textColor: Colors.black,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ContactUs(),
              )),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: HexColor('#ea6c69'),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: Text("Log Out"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
