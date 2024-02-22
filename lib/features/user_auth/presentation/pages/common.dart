// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, sort_child_properties_last, prefer_interpolation_to_compose_strings, unused_import, use_key_in_widget_constructors, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#ffebe3'),
      body: ListView(
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: HexColor('#fed8bf'),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 110,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/back.png'),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Arjun'),
          ),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text('arjunfree256@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Madagadipet, Puducherry'),
          ),
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('+91-8695312076'),
          ),
          ListTile(
            leading: Image.asset(
              'images/insta.png',
              height: 25,
              width: 25,
            ),
            title: Text('arj._.uun'),
          ),
          ListTile(
            leading: Image.asset(
              'images/face.png',
              height: 25,
              width: 25,
            ),
            title: Text('arjun@2005'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(WasteCalculationApp());
}

class WasteCalculationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WasteCalculation(),
    );
  }
}

class WasteCalculation extends StatefulWidget {
  const WasteCalculation({Key? key}) : super(key: key);

  @override
  State<WasteCalculation> createState() => _WasteCalculationState();
}

class _WasteCalculationState extends State<WasteCalculation> {
  TextEditingController biodegradableController = TextEditingController();
  TextEditingController nonBiodegradableController = TextEditingController();

  String biodegradableWeightInKg = '';
  String nonBiodegradableWeightInKg = '';
  String biodegradableResultInUnits = '';
  String nonBiodegradableResultInUnits = '';
  String totalWaste = '';

  void convertBiodegradableToKg(String value) {
    try {
      double grams = double.parse(value);
      double kilograms = (grams / 1000).roundToDouble();
      setState(() {
        biodegradableWeightInKg = kilograms.toStringAsFixed(2);
        double result = (kilograms * 4.94 / 100).roundToDouble();
        biodegradableResultInUnits = result.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        biodegradableWeightInKg = '';
        biodegradableResultInUnits = '';
      });
    }
  }

  void convertNonBiodegradableToKg(String value) {
    try {
      double grams = double.parse(value);
      double kilograms = (grams / 1000).roundToDouble();
      setState(() {
        nonBiodegradableWeightInKg = kilograms.toStringAsFixed(2);
        double result = (kilograms / 0.314 / 1000).roundToDouble();
        nonBiodegradableResultInUnits = result.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        nonBiodegradableWeightInKg = '';
        nonBiodegradableResultInUnits = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalWaste = 0.0;
    if (biodegradableResultInUnits.isNotEmpty) {
      totalWaste += double.parse(biodegradableResultInUnits).roundToDouble();
    }
    if (nonBiodegradableResultInUnits.isNotEmpty) {
      totalWaste += double.parse(nonBiodegradableResultInUnits).roundToDouble();
    }

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
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          '\n\n\nBiodegradable',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40),
                        Text('Weight', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 150,
                          color: HexColor('#edb0ab'),
                          child: TextField(
                            controller: biodegradableController,
                            onChanged: convertBiodegradableToKg,
                            decoration: InputDecoration(
                              hintText: '     In Grams',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Weight in kg: $biodegradableWeightInKg'),
                        SizedBox(height: 20),
                        Text(
                          'Unit Used ',
                          style: TextStyle(fontSize: 20),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: 50,
                            width: 150,
                            color: HexColor('#edb0ab'),
                            child: Center(
                                child: Text('$biodegradableResultInUnits')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    bottom: 100,
                    left: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          '\n\n\nNon Biodegradable',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40),
                        Text('Weight', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 150,
                          color: HexColor('#edb0ab'),
                          child: TextField(
                            controller: nonBiodegradableController,
                            onChanged: convertNonBiodegradableToKg,
                            decoration: InputDecoration(
                              hintText: '     In Grams',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Weight in kg: $nonBiodegradableWeightInKg'),
                        SizedBox(height: 20),
                        Text(
                          'Unit Used ',
                          style: TextStyle(fontSize: 20),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: 50,
                            width: 150,
                            color: HexColor('#edb0ab'),
                            child: Center(
                                child: Text('$nonBiodegradableResultInUnits')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 25,
                    bottom: 100,
                    left: 0,
                    child: Container(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: HexColor('#ea6c69'),
        child: Row(
          children: [
            Container(
              width: 230,
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Text('Total Units: $totalWaste',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(width: 15),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ElectricityBill(totalWaste: totalWaste)));
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    color: HexColor('#ffebe3'),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Click to View\npayable amount',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ElectricityBill extends StatefulWidget {
  final double totalWaste;
  const ElectricityBill({Key? key, required this.totalWaste}) : super(key: key);

  @override
  State<ElectricityBill> createState() => _ElectricityBillState();
}

class _ElectricityBillState extends State<ElectricityBill> {
  TextEditingController biodegradableController = TextEditingController();
  TextEditingController nonBiodegradableController = TextEditingController();

  String Electricity = '';

  void convertBiodegradableToKg(String value) {
    try {
      double units = double.parse(value);
      double amount = units * 3;
      setState(() {
        Electricity = amount.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        Electricity = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalWaste = widget.totalWaste;
    double totalWasteMultiplied = (totalWaste * 3).roundToDouble();

    double electricityAmount = double.tryParse(Electricity) ?? 0.0;
    double remainingAmount =
        (electricityAmount - totalWasteMultiplied).roundToDouble();

    return Scaffold(
      backgroundColor: HexColor('#ffebe3'),
      appBar: AppBar(
        backgroundColor: HexColor('#ea6c69'),
        title: Text(
          '\t\t       EmpowerWaste',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          '\n\nElectricity \nconsumed',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 70),
                        Text('Units', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 150,
                          color: HexColor('#edb0ab'),
                          child: TextField(
                            controller: biodegradableController,
                            onChanged: convertBiodegradableToKg,
                            decoration: InputDecoration(
                              hintText: '     In Units',
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Amount ',
                          style: TextStyle(fontSize: 20),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: 50,
                            width: 150,
                            color: HexColor('#edb0ab'),
                            child: Center(child: Text('$Electricity')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    bottom: 100,
                    left: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          '\n\n    Electricity \ngenerated from\nburning waste',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40),
                        Text('Units', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20),
                        Container(
                          color: HexColor('#edb0ab'),
                          height: 50,
                          width: 150,
                          child: Center(child: Text('$totalWaste')),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Amount ',
                          style: TextStyle(fontSize: 20),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: 50,
                            width: 150,
                            color: HexColor('#edb0ab'),
                            child: Center(child: Text('$totalWasteMultiplied')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 25,
                    bottom: 100,
                    left: 0,
                    child: Container(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: HexColor('#ea6c69'),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Text('Total Amount: $remainingAmount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}

class GetHelp extends StatefulWidget {
  const GetHelp({super.key});

  @override
  State<GetHelp> createState() => _GetHelpState();
}

class _GetHelpState extends State<GetHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class HousePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#ffebe3'),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            backgroundColor: HexColor('#ea6c69'),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'EmpowerWaste',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              background: Container(
                color: HexColor('#ea6c69'),
                child: Image.asset(
                  'images/back.png',
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  color: HexColor('#edb0ab'),
                  height: 250,
                  child: Column(children: [
                    Text(
                      '\nWaste Energy Calculation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '\n\t•	Predict the energy potential of waste, offering insights into sustainable energy production methods.\n\t•	Visualize the environmental impact, motivating users to reduce waste and harness renewable resources.')
                  ])),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  color: HexColor('#edb0ab'),
                  height: 250,
                  child: Column(children: [
                    Text(
                      '\nElectricity Bill Calculation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '\n\t•	Provide real-time estimates of electricity bills based on consumption patterns.\n\t•	Offer personalized suggestions for energy-saving practices to lower bills and reduce carbon footprint.')
                  ])),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  color: HexColor('#edb0ab'),
                  height: 250,
                  child: Column(children: [
                    Text(
                      '\nWallet',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '\n\t•	Seamlessly track expenses related to waste management and energy usage.\n\t•	Enable budget management and financial transparency for sustainable living.')
                  ])),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  color: HexColor('#edb0ab'),
                  height: 250,
                  child: Column(children: [
                    Text(
                      '\nImage Segregation with Gemini AI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '\n\t•	Utilize cutting-edge AI to accurately classify waste images into biodegradable and non-biodegradable categories.\n\t•	Educate users on proper disposal methods, promoting responsible recycling and waste reduction efforts.')
                  ])),
            ),
          )),
        ],
      ),
    );
  }
}

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
