import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librarycom/utils/global_methods.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final auth = FirebaseAuth.instance;

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
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.all(0),
            // padding: EdgeInsets.all(0),
            accountEmail: Text(
              auth.currentUser!.email!,
              style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  ),
            ),
            accountName: const Text(
              "Martinson Joshua Tetteh",
              style: TextStyle(
                  // color: Colors.grey[800],

                  ),
            ),
            currentAccountPicture: const CircleAvatar(
              foregroundImage: AssetImage("assets/icons/community.png"),
            ),
          ),

          // todo: DRAWER BODY
          Expanded(
            child: Column(
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
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
