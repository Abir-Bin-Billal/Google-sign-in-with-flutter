import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google sign in"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: (){
                signInWithGoogle().then((value){
                  print("user details : ${jsonEncode(value.toString())}");
                  setState(() {
                    loading = false;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(displayName: value.user?.displayName??"")));
                  });

                });
              },
              child: loading? CircularProgressIndicator(): Text("Sign in with google")),
        ),),
      ),
    );
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    setState(() {
      loading = true;
    });

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
