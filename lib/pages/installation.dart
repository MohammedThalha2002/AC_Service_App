import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../backend/send_notification.dart';

class Installation extends StatefulWidget {
  final String tokenId;
  final String name;
  final String phoneNumber;
  const Installation({
    Key? key,
    required this.tokenId,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _InstallationState createState() => _InstallationState();
}

class _InstallationState extends State<Installation> {
  String? brandValue;
  String? capacityValue;
  String? serviceValue;
  List<String> brand = [
    'LG',
    'Voltas',
    'O General',
    'Whirlphool',
  ];
  List<String> capacity = [
    '1 Ton',
    '1.5 Ton',
    '2 Ton',
  ];
  List<String> service = [
    'Old AC',
    'New AC',
  ];
  String? _chosenValue;
  int _currentPage = 0;
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  addDetails() async {
    await firestore
        .collection("Users")
        .doc(user!.uid)
        .collection("History")
        .add({
      "brand": brandValue,
      "capacity": capacityValue,
      "service": serviceValue,
      "type": "Installation",
      "date": DateTime.now().toString(),
    });
    await firestore.collection("Orders").add({
      "name": widget.name,
      "phoneNumber": widget.phoneNumber,
      "brand": brandValue,
      "capacity": capacityValue,
      "service": serviceValue,
      "type": "Installation",
      "date": DateTime.now().toString(),
    }).whenComplete(
      () => showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          title: Lottie.asset(
            'assets/success.json',
            width: 100,
            height: 100,
          ),
          content: new Text('Your Request has been accepted successfully'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(
          children: [
            SizedBox(
              height: 250,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage("assets/install1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage("assets/install2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage("assets/install3.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage("assets/install4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height - 258,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 6,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "BRAND",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                items: brand
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: brandValue,
                                onChanged: (value) {
                                  setState(() {
                                    brandValue = value as String;
                                  });
                                },
                                icon: Image.asset("assets/dropdownIcon.png"),
                                iconSize: 14,
                                buttonWidth: double.infinity,
                                buttonPadding: const EdgeInsets.all(12),
                                buttonDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: Offset(2, 5),
                                        blurRadius: 5,
                                        spreadRadius: 4),
                                  ],
                                ),
                                buttonElevation: 5,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 300,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                dropdownElevation: 8,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "CAPACITY",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                items: capacity
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: capacityValue,
                                onChanged: (value) {
                                  setState(() {
                                    capacityValue = value as String;
                                  });
                                },
                                icon: Image.asset("assets/dropdownIcon.png"),
                                iconSize: 14,
                                buttonWidth: double.infinity,
                                buttonPadding: const EdgeInsets.all(12),
                                buttonDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: Offset(2, 5),
                                        blurRadius: 5,
                                        spreadRadius: 4),
                                  ],
                                ),
                                buttonElevation: 5,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 300,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                dropdownElevation: 8,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "SERVICE",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                items: service
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: serviceValue,
                                onChanged: (value) {
                                  setState(() {
                                    serviceValue = value as String;
                                  });
                                },
                                icon: Image.asset("assets/dropdownIcon.png"),
                                iconSize: 14,
                                buttonWidth: double.infinity,
                                buttonPadding: const EdgeInsets.all(12),
                                buttonDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: Offset(2, 5),
                                        blurRadius: 5,
                                        spreadRadius: 4),
                                  ],
                                ),
                                buttonElevation: 5,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 300,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                dropdownElevation: 8,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              if (brandValue != null &&
                                  capacityValue != null &&
                                  serviceValue != null) {
                                addDetails();
                                sendNotification(
                                  tokenIdList: [widget.tokenId],
                                  heading: "Installation Request",
                                  contents:
                                      "An Installation request from the customer",
                                ).then((value) => Get.back());
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      new AlertDialog(
                                    title: Lottie.asset(
                                      'assets/alert.json',
                                      width: 100,
                                      height: 100,
                                    ),
                                    content: new Text(
                                        'Please choose all the fields'),
                                    actions: <Widget>[
                                      new IconButton(
                                          icon: new Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFF8D8379),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
