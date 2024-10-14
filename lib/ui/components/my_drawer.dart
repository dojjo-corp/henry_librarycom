import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:librarycom/utils/global_methods.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  signOut() {
    showMyDialog(
      context,
      title: "Sign out",
      onOkay: () async {
        try {
          await FirebaseAuth.instance.signOut();

          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/login",
              (route) => false,
            );
          }
        } catch (e) {
          if (mounted) {
            showSnackBar(
              context,
              "Error signing out: ${e.toString()}",
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // todo: DRAWER HEADER
          const DrawerHeader(
            margin: EdgeInsets.all(0),
            child: Column(
              children: [
                CircleAvatar(),
                Text(
                  "Username",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text("email@gmail.com"),
              ],
            ),
          ),

          // todo: DRAWER BODY
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/my-profile");
                    },
                    child: const ListTile(
                      leading: Icon(Icons.person_outline_outlined),
                      title: Text(
                        "My Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/my-profile");
                    },
                    child: const ListTile(
                      leading: Icon(Icons.person_outline_outlined),
                      title: Text(
                        "My Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/my-profile");
                    },
                    child: const ListTile(
                      leading: Icon(Icons.person_outline_outlined),
                      title: Text(
                        "My Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/my-profile");
                    },
                    child: const ListTile(
                      leading: Icon(Icons.person_outline_outlined),
                      title: Text(
                        "My Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: signOut,
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                        color: Colors.red[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
