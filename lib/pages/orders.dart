import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 255, 32, 162),
            Color.fromARGB(255, 255, 34, 34),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Your Orders",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Orders")
              .orderBy("date", descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                var date = data['date'].toString().substring(0, 10);

                if (data['type'] == 'Complaint') {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(date),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              data['type'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data['number'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Complaint :  " + data['complaint'],
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            print("selected");
                            Get.defaultDialog(
                                title: "Did you delevired the product",
                                content: Lottie.asset(
                                  "assets/delete_show.json",
                                  height: 200,
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        String docId = snapshot
                                            .data!.docs[index].reference.id
                                            .toString();
                                        await FirebaseFirestore.instance
                                            .collection("Orders")
                                            .doc(docId)
                                            .delete()
                                            .then((value) => Get.back())
                                            .then((value) {
                                          Get.snackbar(
                                            "Deleted Successfully",
                                            "The product has been removed from your delivery list",
                                          );
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                      child: Text("YES"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.only(left: 5),
                                      ),
                                      child: Text("NO"),
                                    ),
                                  ),
                                ]);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(date),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              data['service'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data['phoneNumber'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Brand :  " + data['brand'],
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Capacity :  " + data['capacity'],
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            print("selected");
                            Get.defaultDialog(
                                title: "Did you delevired the product",
                                content: Lottie.asset(
                                  "assets/delete_show.json",
                                  height: 200,
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        String docId = snapshot
                                            .data!.docs[index].reference.id
                                            .toString();
                                        await FirebaseFirestore.instance
                                            .collection("Orders")
                                            .doc(docId)
                                            .delete()
                                            .then((value) => Get.back())
                                            .then((value) {
                                          Get.snackbar(
                                            "Deleted Successfully",
                                            "The product has been removed from your delivery list",
                                          );
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                      child: Text("YES"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.only(left: 5),
                                      ),
                                      child: Text("NO"),
                                    ),
                                  ),
                                ]);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
