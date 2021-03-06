import 'package:ac_service_app/backend/google-sign-in.dart';
import 'package:ac_service_app/pages/home_page.dart';
import 'package:ac_service_app/pages/phone_verification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? name;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueAccent,
            Colors.purpleAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "SIGN IN",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: Color.fromARGB(255, 24, 24, 24),
                      ),
                      hintText: "Name",
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    maxLength: 10,
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 24, 24, 24),
                      ),
                      hintText: "Phone Number",
                    ),
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (name != null && phoneNumber != null) {
                      Get.to(
                        phoneVerification(
                          phoneNumber: phoneNumberController.text,
                          name: nameController.text,
                        ),
                        transition: Transition.native,
                        curve: Curves.easeIn,
                        duration: Duration(seconds: 1),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => new AlertDialog(
                          title: Lottie.asset(
                            'assets/alert.json',
                            width: 100,
                            height: 100,
                          ),
                          content: new Text('Please Enter all the fields'),
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
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Spacer(),
                Text("or"),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Sign in with",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.7, 50),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      signInWithGoogle().then((value) async {
                        if (value.user != null) {
                          await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(value.user!.uid)
                              .collection("Details")
                              .doc("details")
                              .set({
                            "name": value.user!.displayName.toString(),
                            "phoneNumber": value.user!.phoneNumber.toString(),
                          }).then(
                            (value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false),
                          );
                        }
                      });
                    } catch (e) {
                      Get.snackbar(
                        "Error",
                        "Something went wrong. Please check your connection",
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/google-logo.png",
                        height: 35,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
