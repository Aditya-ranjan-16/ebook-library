import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Homepage.dart';
import 'package:provider/provider.dart';
import 'package:ebook/provider/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text("Error"),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider(
              create: (context) => GoogleSignInProvider(),
              child: MaterialApp(
                title: "ebookUI",
                debugShowCheckedModeBanner: false,
                home: new Homepage(),
                routes: <String, WidgetBuilder>{
                  '/home': (BuildContext context) => new Homepage(),
                },
              ));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    //color: Colors.red,
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.center
                        //,stops: [0.7,0.9]
                        )),
              ),
              Center(child: CircularProgressIndicator())
            ])));
      },
    );
  }
}
