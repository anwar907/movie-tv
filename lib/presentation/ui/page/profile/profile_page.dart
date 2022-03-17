import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf7f7fb),
      body: Padding(
        padding: EdgeInsets.only(top: 26),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.lightBlue),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://4.bp.blogspot.com/-wJ5prQ0K8qI/WsQ9UKn4xII/AAAAAAAABVI/cVns-SfXZy8hj4G9LBv55aLpCXLD3BvZACLcBGAs/s320/sembalun%2B2018_101.jpg"))),
                ),
                const SizedBox(height: 5),
                Text(
                  "Anwar Sapi'i",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  "Mobile Developer",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
