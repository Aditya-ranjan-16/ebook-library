import 'dart:ui';
import 'package:ebook/Homepage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ebook/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);

            if (provider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              User u = FirebaseAuth.instance.currentUser;
              Navigator.of(context).pop();
            } else {
              return SafeArea(
                  child: Container(
                decoration: BoxDecoration(
                    //color: Colors.red,
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.center
                        //,stops: [0.7,0.9]
                        )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/jis.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: null /* add child content here */,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 20,
                      ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 20,
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: size.width * 0.8,
                        child: Card(
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150),
                          ),
                          elevation: 7,
                          child: ListTile(
                            onTap: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.login();
                            },
                            leading: FaIcon(FontAwesomeIcons.google,
                                color: Colors.white),
                            title: Text(
                              "Sign in with google ",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ));
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Container(
              decoration: BoxDecoration(
                  //color: Colors.red,
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.center
                      //,stops: [0.7,0.9]
                      ))),
          Center(child: CircularProgressIndicator()),
        ],
      );
}
