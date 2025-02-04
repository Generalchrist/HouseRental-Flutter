import 'package:client_mobile/views/advertising/newAdvertiseForm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../advertising/advertisingForm.dart';
import '../../advertising/myAdvertising.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String name;
  late String email;

  @override
  void initState() {
    getLocalData();
  }

  getLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name')!;
      email = prefs.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Container(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.amber,
                    ),
                    Text(
                      " " + name,
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.amber,
                    ),
                    Text(" " + email),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(height: 20),
          Container(
            decoration: new BoxDecoration(
              boxShadow: [
                //color: Colors.white, //background color of box
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                  offset: Offset(
                    8.0, // Move to right 10  horizontally
                    8.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: ProfileMenu(
              text: "My Advertisement",
              icon: "assets/icons/Bell.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MyAdvertising()));
              },
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              boxShadow: [
                //color: Colors.white, //background color of box
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                  offset: Offset(
                    8.0, // Move to right 10  horizontally
                    8.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: ProfileMenu(
              text: "Add New +",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => newAdvertisingForm()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
