import 'package:firebase_tutorial/screens/login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  String displayName;
   HomeScreen({super.key , required this.displayName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.displayName),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            await GoogleSignIn().signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
