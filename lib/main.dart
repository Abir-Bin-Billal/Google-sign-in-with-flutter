import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_tutorial/screens/login_Screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDoNdpb9caJAC3N6j4sz9yaALKbVOE7yoQ",
        appId: "1:55731425741:android:88651c624261222e6bf484",
        messagingSenderId: "55731425741",
        projectId:"flutter-firebase-f0b47" )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}

