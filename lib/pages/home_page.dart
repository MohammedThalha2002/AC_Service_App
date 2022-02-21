import 'dart:async';
import 'dart:convert';
import 'package:ac_service_app/pages/complaints.dart';
import 'package:ac_service_app/pages/installation.dart';
import 'package:ac_service_app/pages/login_page.dart';
import 'package:ac_service_app/pages/my_orders.dart';
import 'package:ac_service_app/pages/orders.dart';
import 'package:ac_service_app/pages/our_profile.dart';
import 'package:ac_service_app/pages/our_projects.dart';
import 'package:ac_service_app/pages/service.dart';
import 'package:ac_service_app/pages/support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _url =
      'https://www.justdial.com/Tiruvallur/BMS-Ac-World-Home-Appliances-Opposite-Fire-Station-Tiruvallur-HO/9999PXX44-XX44-140313145125-Z4A3_BZDET';
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  User? user = FirebaseAuth.instance.currentUser;
  int _currentPage = 0;
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  String name = "";
  String phoneNumber = "";
  String initialLetter = "";
  String tokenId = "";

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
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
    gettingData();
  }

  gettingData() async {
    //tokenID
    await FirebaseFirestore.instance
        .collection('admin')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          tokenId = doc["tokenId"];
        });
      });
    });
    print("Getting data from firestore" + tokenId);
    // Username
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .collection("Details")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          name = doc["name"];
          phoneNumber = doc['phoneNumber'];
        });
      });
    });
    setState(() {
      initialLetter = name.substring(0, 1);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMS AC WORLD"),
      ),
      drawer: Drawer(
        elevation: 20,
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  initialLetter,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Orders"),
              trailing: IconButton(
                onPressed: () {
                  Get.to(MyOrders());
                },
                icon: Icon(Icons.arrow_forward),
              ),
            ),
            ListTile(
              title: Text("Our Profile"),
              trailing: IconButton(
                onPressed: () {
                  Get.to(OurProfile());
                },
                icon: Icon(Icons.arrow_forward),
              ),
            ),
            ListTile(
              title: Text("Our Projects"),
              trailing: IconButton(
                onPressed: () {
                  Get.to(OurProjects());
                },
                icon: Icon(Icons.arrow_forward),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Logout"),
              trailing: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                        (value) => Get.to(
                          LoginPage(),
                        ),
                      );
                },
                icon: Icon(
                  Icons.account_circle_rounded,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: new AssetImage("assets/AC1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: new AssetImage("assets/AC2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: new AssetImage("assets/AC3.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 2,
                ),
                itemCount: 9,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var imgIndex = index + 1;
                  return InkWell(
                    onTap: () {
                      // print(imgIndex);
                      // Get.to(Settings());
                      if (imgIndex == 1) {
                      } else if (imgIndex == 2) {
                      } else if (imgIndex == 3) {
                        Get.to(Service(
                          tokenId: tokenId,
                          name: name,
                          phoneNumber: phoneNumber,
                        ));
                      } else if (imgIndex == 4) {
                        Get.to(Installation(
                          tokenId: tokenId,
                          name: name,
                          phoneNumber: phoneNumber,
                        ));
                      } else if (imgIndex == 5) {
                        Get.to(Complaints(
                          tokenId: tokenId,
                          name: name,
                          phoneNumber: phoneNumber,
                        ));
                      } else if (imgIndex == 6) {
                        Get.to(Support());
                      } else if (imgIndex == 7) {
                      } else if (imgIndex == 8) {
                        _launchURL();
                      } else if (imgIndex == 9) {}
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 4,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/img" + "$imgIndex" + ".png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
