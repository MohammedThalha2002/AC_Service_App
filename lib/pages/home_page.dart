import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(
                "assets/Ac_room.png",
                fit: BoxFit.fill,
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
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(),
                      ),
                      child: Image.asset(
                        "assets/img" + "$imgIndex" + ".png",
                        fit: BoxFit.contain,
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
