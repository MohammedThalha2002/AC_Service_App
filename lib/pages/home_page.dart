import 'dart:async';
import 'package:ac_service_app/pages/complaints.dart';
import 'package:ac_service_app/pages/installation.dart';
import 'package:ac_service_app/pages/service.dart';
import 'package:ac_service_app/pages/support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  int _currentPage = 0;
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

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
                height: 15,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
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
                        Get.to(Service());
                      } else if (imgIndex == 4) {
                        Get.to(Installation());
                      } else if (imgIndex == 5) {
                        Get.to(Complaints());
                      } else if (imgIndex == 6) {
                        Get.to(Support());
                      } else if (imgIndex == 7) {
                      } else if (imgIndex == 8) {
                        _launchURL();
                      } else if (imgIndex == 9) {}
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
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
