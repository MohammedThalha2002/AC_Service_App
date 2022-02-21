import 'package:flutter/material.dart';

class OurProfile extends StatelessWidget {
  const OurProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            RichText(
              text: TextSpan(
                text: "Dear Sir,",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text:
                        '''\n\n       I am glad to introduce our team as a successful enterprise with more than 20 years of expertise in the field of Education, Entertainment, Food Processing and Consumer enterprise activities in Tiruvallur.''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''\n\n       In consumer durables sector, we have the Multi brand Exclusive AC Showroom named “BMS AC WORLD”. Our showroom is located at 216, TNHB Road ,Avadi Bye Pass Road, Tiruvallur. BMS AC WORLD is an Air conditioning sales and service organization established in service motive to render Comfort solutions to everyone in the field or Air-conditioning.\n\n       ''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''Authorized Sales and Service Dealer for Trivellore District: ''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.5,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''VOLTAS, DAIKIN, MITSUBISHI, O GENERAL, ONIDA, VESTAR, CARRIER, SAMSUNG, HITACHI, LLOYD, PANASONIC.\n\n       ''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.5,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '''BMS AC WORLD ''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''is proud to provide its customers a wide range of Multi brand air conditioners with the highest quality products at amazingly low prices for shopping and you can save up to your satisfaction. BMS AC WORLD is backed by staff with vesatile field experience in the air conditioning industry to support you around the clock, 7 days a week, 365 days a year.\n\n     ''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '''BMS AC WORLD ''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''Exclusive AC showroom offers full warranties, best installation practice, free door Delivery of AC unit and awesome customer service, we offer a free Teleservice by calling the customers over phone; this will inform you of new product arrivals, discount coupons and other great promotions.\n\n     ''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '''BMS AC WORLD ''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''prices are so low, we often sell out of items quickly, to ensure you don’t miss out on a bargain, We can offer such competitive Low Prices Because we are the authorized sales and service dealers for many popular brands of Air conditioners.\n\n     ''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '''BMS AC WORLD ''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''focus on supplying high volumes at low margins which means great deals for you.\n\n''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '''Products/Services for Air Chills Systems: \n\n''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''All brands of Air chill Systems -Split &amp; Window, Ductable Air Conditioner, Cassette Type, Package &amp; Chiller Plant, Water Cooler, Hot/Cold Water Dispensers.\n\n''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''Annual Maintenance Contract (Labour &amp; Comprehensive) for All Brands of Air-Conditioners.\n\n''',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''Looking forward to having a memorable partnership with you. \n\n''',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '''                       Thanking you,
                           Yours,
                        B. NIRMALKUMAR
                          9884066055
                        BMS AC WORLD''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
