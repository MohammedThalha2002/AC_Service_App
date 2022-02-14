import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../backend/send_notification.dart';

class Complaints extends StatefulWidget {
  final String tokenId;
  final String name;
  final String phoneNumber;
  const Complaints({
    Key? key,
    required this.tokenId,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  String? name;
  String? phoneNumber;
  String? complaints;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController complaintsController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  addDetails() async {
    await firestore
        .collection("Users")
        .doc(user!.uid)
        .collection("History")
        .add({
      "name": name,
      "number": phoneNumber,
      "complaint": complaints,
      "type": "Complaint",
      "date": DateTime.now().toString(),
    });
    await firestore.collection("Orders").add({
      "name": name,
      "number": phoneNumber,
      "complaint": complaints,
      "type": "Complaint",
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF94FAFC),
              Color(0xFF61E261),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: 10,
                left: 0,
                child: Image.asset(
                  "assets/complaint.png",
                  height: 200,
                  width: 200,
                ),
              ),
              Positioned(
                top: 20,
                left: 180,
                child: Text(
                  "Don't Worry..\nWe will help you",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 130,
                child: Text(
                  "Please let us know any\ncomplaints about our\nservice",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 220,
                      ),
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
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 4,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: Offset(2, 5),
                                        blurRadius: 5,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: "Name",
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      name = value;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 4,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: Offset(2, 5),
                                        blurRadius: 5,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: "Contact Number",
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      phoneNumber = value;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 4,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: Offset(2, 5),
                                        blurRadius: 5,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: complaintsController,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: "Write Your Complaints here",
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      complaints = value;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              InkWell(
                                onTap: () {
                                  if (name != null &&
                                      phoneNumber != null &&
                                      complaints != null) {
                                    addDetails();
                                    sendNotification(
                                      tokenIdList: [widget.tokenId],
                                      heading: "Installation Request",
                                      contents:
                                          "An Installation request from the customer",
                                    );
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
                                            'Please enter all the fields'),
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
                                    color: Color(0xFFA0E28A),
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
            ],
          ),
        ),
      ),
    );
  }
}
