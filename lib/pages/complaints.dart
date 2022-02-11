import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        body: Stack(children: [
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
                SizedBox(
                  height: 220,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 220,
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
                              decoration: InputDecoration(
                                hintText: "Name",
                                border: InputBorder.none,
                              ),
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Contact Number",
                                border: InputBorder.none,
                              ),
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
                              maxLines: 5,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Write Your Complaints here",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    new AlertDialog(
                                      title: Lottie.asset(
                                        'assets/success.json',
                                        width: 100,
                                        height: 100,
                                      ),
                                      content: new Text(
                                          'Your Complaint has been accepted successfully'),
                                      actions: <Widget>[
                                        new IconButton(
                                            icon: new Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    ));
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
        ]),
      ),
    );
  }
}
