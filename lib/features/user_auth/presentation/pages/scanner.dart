// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:bootcamp/features/user_auth/presentation/pages/Wallet.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/common.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/imagebot.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/settings.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/slide.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PageScanner extends StatefulWidget {
  const PageScanner({Key? key}) : super(key: key);

  @override
  State<PageScanner> createState() => _PageScannerState();
}

class _PageScannerState extends State<PageScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#ffebe3'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: HexColor('#fed8bf'),
                    height: 250,
                    width: 5000,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 250,
                          width: 350,
                          child: SliderP(),
                        ),
                      ],
                    )),
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => ImageBot(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 5,
                              ),
                            ),
                            child: Column(children: [
                              Container(
                                color: Colors.white,
                                height: 100,
                                width: 150,
                                child: Image.asset('images/image.gif'),
                              ),
                              Container(
                                  height: 30,
                                  width: 150,
                                  color: Colors.white,
                                  child: Center(
                                      child: Text(
                                    'ImageBot',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                            ]),
                          ),
                        )),
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => WalletPage(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 5,
                              ),
                            ),
                            child: Column(children: [
                              Container(
                                color: Colors.white,
                                height: 100,
                                width: 150,
                                child: Image.asset('images/wallet.gif'),
                              ),
                              Container(
                                  height: 30,
                                  width: 150,
                                  color: Colors.white,
                                  child: Center(
                                      child: Text(
                                    'Wallet',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                            ]),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  children: [
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WasteCalculation(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 5,
                              ),
                            ),
                            child: Column(children: [
                              Container(
                                color: Colors.white,
                                height: 100,
                                width: 150,
                                child: Image.asset('images/calculator.gif'),
                              ),
                              Container(
                                  height: 30,
                                  width: 150,
                                  color: Colors.white,
                                  child: Center(
                                      child: Text(
                                    'Waste Calculation',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                            ]),
                          ),
                        )),
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => SettingsPage(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 5,
                              ),
                            ),
                            child: Column(children: [
                              Container(
                                color: Colors.white,
                                height: 100,
                                width: 150,
                                child: Image.asset('images/settings.gif'),
                              ),
                              Container(
                                  height: 30,
                                  width: 150,
                                  color: Colors.white,
                                  child: Center(
                                      child: Text(
                                    'Settings',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                            ]),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
