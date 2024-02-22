// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_import

import 'package:bootcamp/features/user_auth/presentation/pages/Wallet.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/common.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/home_page.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/login_page.dart';
import 'package:bootcamp/features/user_auth/presentation/pages/notify.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#ffebe3'),
      appBar: AppBar(
        backgroundColor: HexColor('#ea6c69'),
        title: Text(
          '\t\t          EmpowerWaste',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Wallet'),
              subtitle: SoftWrap(
                children: [
                  Text('To see wallet'),
                ],
              ),
              leading: Icon(Icons.wallet_rounded, size: 40),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WalletPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Waste Weight Calucation'),
              subtitle: SoftWrap(
                children: [
                  Text('To mesure Waste Calucation'),
                ],
              ),
              leading: Icon(Icons.calculate_outlined, size: 40),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WasteCalculation(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Theme'),
              subtitle: SoftWrap(
                children: [
                  Text('To change dark mode'),
                ],
              ),
              leading: Icon(Icons.light_mode_outlined, size: 40),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app, size: 40),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
  ));
}

class SoftWrap extends StatelessWidget {
  final List<Widget> children;

  SoftWrap({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
    );
  }
}
