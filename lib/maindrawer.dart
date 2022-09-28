import 'package:flutter/material.dart';
import 'package:streetvendor/contacts.dart';
import 'package:streetvendor/home2.dart';
import 'package:streetvendor/loginpage.dart';
import 'package:streetvendor/settings.dart';

class maindrawer extends StatelessWidget {
  const maindrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xFFc51c6b),
            Color(0xFFbc6c97),
            Color(0xFF3f6fdf),
          ])),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage("https://via.placeholder.com/150"),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hello,Mr.Vendor",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => home2()));
            },
            leading: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            title: Text(
              "Edit Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => contacts()));
            },
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              "Contacts",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => settings()));
            },
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(), //here is a divider
          Text(
            "-----------------------------------------------------------------------",
            style: TextStyle(color: Colors.white),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              "Log-out",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
