import 'package:ebook/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './models/data.dart';
import './detailsPage.dart';
import './categories.dart';
import './login.dart';

class Homepage extends StatefulWidget {
  User user;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int indx = 0;
  String br = "B.tech cse";
  String sr = "";
  int no = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //CollectionReference book = FirebaseFirestore.instance.collection('BOOK');

    widget.user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
            decoration: BoxDecoration(
                //color: Colors.red,
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                    //,stops: [0.7,0.9]
                    )),
            child: Stack(children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/jis.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: null /* add child content here */,
                        ),
                      ],
                    ),
                  ),
                  Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/1st.jpg"),
                    ),
                    title: Text('1st Year'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CategoryPage(
                            year: 1,
                          );
                        }),
                      );
                    },
                  )),
                  Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/2nd.jpg"),
                    ),
                    title: Text('2nd Year'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CategoryPage(
                            year: 2,
                          );
                        }),
                      );
                    },
                  )),
                  Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/3rd.jpg"),
                    ),
                    title: Text('3rd Year'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CategoryPage(
                            year: 3,
                          );
                        }),
                      );
                    },
                  )),
                  Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/4th.jpg"),
                    ),
                    title: Text('4th Year'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CategoryPage(
                            year: 4,
                          );
                        }),
                      );
                    },
                  )),
                ],
              ),
              Positioned(
                  bottom: 0,
                  width: size.width * 1,
                  height: size.height * 0.2,
                  child: Column(children: [
                    Card(
                        child: ListTile(
                      leading: Icon(Icons.download_done_outlined),
                      title: Text(
                        'Downloads',
                      ),
                      onTap: () {
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            content: Text("You have No Downloads Yet"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
                    widget.user != null
                        ? Card(
                            child: ListTile(
                                leading: Icon(Icons.logout),
                                title: Text(
                                  'Logout',
                                ),
                                onTap: () async {
                                  // print(use);

                                  final h = Provider.of<GoogleSignInProvider>(
                                      context,
                                      listen: false);
                                  await h.logout();

                                  setState(() {
                                    widget.user = null;
                                  });
                                  Navigator.of(context).pop();
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      content: Text(
                                          "You have successfully Loged Out"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                        : Text("")
                  ])),
            ])),
      ),
      body: Container(
          decoration: BoxDecoration(
              //color: Colors.red,
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.center
                  //,stops: [0.7,0.9]
                  )),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    //color: Colors.blue.shade200,
                    width: double.infinity,
                    height: size.height * 0.091,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();

                                setState(() {});
                              },
                            ),
                            widget.user == null
                                ? OutlinedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.lightBlue)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Text(
                                      "LogIn",
                                      style: TextStyle(color: Colors.black),
                                    ))
                                : Card(
                                    color: Colors.blue.shade700,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(150),
                                    ),
                                    child: Flexible(
                                        child: Row(children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(widget.user.photoURL),
                                        radius: 20,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        widget.user.displayName.split(" ")[0],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                    ]))),
                            Container(
                              height: constraints.maxHeight * 0.8,
                              width: constraints.maxWidth * 0.3,
                              child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "E Book Library",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Color.fromRGBO(44, 44, 44, 1),
                                    )),
                                  )),
                            ),
                            Container(
                              height: constraints.maxHeight * 0.61,
                              width: constraints.maxHeight * 0.61,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      constraints.maxHeight * 0.02),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/jis.png"))),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: double.infinity,
                    //color: Colors.purple,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.02),
                              height: constraints.maxHeight * 0.7,
                              child: Center(
                                child: Text(
                                  " If education is identical with information, the libraries are the greatest sages in the world, and encyclopedias are the Rishis.",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.brown,
                                          fontSize: 20)),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.02),
                              height: constraints.maxHeight * 0.3,
                              child: Center(
                                child: Text(
                                  "― Swami Vivekananda",
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17)),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(size.height * 0.05),
                    child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(size.height * 0.05)),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  //color: Colors.white,
                                  height: constraints.maxHeight * 0.9,
                                  width: constraints.maxWidth * 0.2,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Icon(
                                      Icons.search,
                                      size: 30,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                                Container(
                                    //color: Colors.red,
                                    width: constraints.maxWidth * 0.6,
                                    height: constraints.maxHeight,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          filled: false,
                                          hintText:
                                              "Search by Title,Author,Genre",
                                          hintStyle: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black
                                                      .withOpacity(0.4)))),
                                      cursorColor: Colors.black45,
                                      onChanged: (srh) {
                                        setState(() {
                                          sr = srh;
                                        });
                                      },
                                    )),
                                Container(
                                  //color: Colors.white,
                                  height: constraints.maxHeight * 0.9,
                                  width: constraints.maxWidth * 0.192,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Icon(
                                      Icons.filter_list,
                                      size: 30,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Visibility(
                      visible: sr == "" ? false : true,
                      child: Column(
                        children: [
                          Text(
                            no == 1 ? "No Match found" : "",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.009,
                          ),
                          Container(
                              //color: Colors.green,

                              height: 200,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final Stream<QuerySnapshot> _bookStream1 =
                                      FirebaseFirestore.instance
                                          .collection('BOOK')
                                          .where("bookname", isEqualTo: sr)
                                          .snapshots();

                                  return StreamBuilder<QuerySnapshot>(
                                    stream: _bookStream1,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        return Text('Something went wrong');
                                      }

                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text("Loading");
                                      }

                                      return new ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: snapshot.data.docs
                                            .map((DocumentSnapshot document) {
                                          return Column(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsPage(
                                                          imageAddress:
                                                              document[
                                                                  "imagePath"],
                                                          authorname: document[
                                                              "authorName"],
                                                          bookname: document[
                                                              "bookname"],
                                                          url: document["file"],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal: constraints
                                                                .maxWidth *
                                                            0.025),
                                                    width:
                                                        constraints.maxWidth *
                                                            0.35,
                                                    height:
                                                        constraints.maxHeight *
                                                            0.84,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius
                                                            .circular(constraints
                                                                    .maxHeight *
                                                                0.081),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                document[
                                                                    "imagePath"])),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 3,
                                                              spreadRadius: 2,
                                                              offset:
                                                                  Offset(4, 1),
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1))
                                                        ]),
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          bottom: constraints
                                                                  .maxWidth *
                                                              0.02,
                                                          left: constraints
                                                                  .maxWidth *
                                                              0.02,
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal:
                                                                    constraints
                                                                            .maxHeight *
                                                                        0.015),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .circular(constraints
                                                                            .maxHeight *
                                                                        0.04)),
                                                            height: constraints
                                                                    .maxHeight *
                                                                0.12,
                                                            width: constraints
                                                                    .maxWidth *
                                                                0.12,
                                                            child: FittedBox(
                                                              child: Text(
                                                                "⭐ " +
                                                                    document[
                                                                            "rating"]
                                                                        .toString(),
                                                                style: GoogleFonts.lato(
                                                                    textStyle: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: constraints.maxHeight *
                                                    0.01,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                height: constraints.maxHeight *
                                                    0.07,
                                                width:
                                                    constraints.maxWidth * 0.39,
                                                //color: Colors.red,
                                                child: FittedBox(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      document["bookname"],
                                                      style: GoogleFonts.lato(
                                                          color: Color.fromRGBO(
                                                              66, 66, 86, 1),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              ),
                                              Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05,
                                                  width: constraints.maxWidth *
                                                      0.39,
                                                  //color: Colors.red,
                                                  child: FittedBox(
                                                      child: Text(
                                                    document["authorName"],
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.7))),
                                                  )))
                                            ],
                                          );
                                        }).toList(),
                                      );
                                    },
                                  );
                                },
                              ))
                        ],
                      )),
                  SizedBox(
                    height: size.height * 0.006,
                  ),
                  Container(
                    height: size.height *
                        (1 +
                            (-0.07 -
                                0.005 -
                                0.1 -
                                0.091 -
                                0.042)), //color: Colors.red,

                    child: ListView(
                      children: [
                        Container(
                          //color: Colors.red,
                          height: size.height * 0.35,
                          width: double.infinity,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                children: [
                                  Container(
                                      //color: Colors.purple,
                                      width: constraints.maxWidth,
                                      height: constraints.maxHeight * 0.15,
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              constraints.maxWidth * 0.03),
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: constraints.maxHeight,
                                                width:
                                                    constraints.maxWidth * 0.5,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    "Continue Reading",
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.85),
                                                            fontSize: 25)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: constraints.maxHeight,
                                                width:
                                                    constraints.maxWidth * 0.2,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    "view all",
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 15)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      )),
                                  Container(
                                      //color: Colors.green,
                                      height: constraints.maxHeight * 0.85,
                                      width: constraints.maxWidth,
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          List<Booksdata> current =
                                              continueReading;

                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: current.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsPage(
                                                          imageAddress:
                                                              current[index]
                                                                  .imagePath,
                                                          authorname:
                                                              current[index]
                                                                  .authorName,
                                                          bookname:
                                                              current[index]
                                                                  .bookname,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Hero(
                                                      tag: UniqueKey(),
                                                      child: Container(
                                                        key: UniqueKey(),
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    constraints
                                                                            .maxWidth *
                                                                        0.025),
                                                        width: constraints
                                                                .maxWidth *
                                                            0.34,
                                                        height: constraints
                                                                .maxHeight *
                                                            0.84,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    constraints
                                                                            .maxHeight *
                                                                        0.081),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    current[index]
                                                                        .imagePath)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius: 3,
                                                                  spreadRadius:
                                                                      2,
                                                                  offset:
                                                                      Offset(
                                                                          4, 1),
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1))
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.01,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: constraints
                                                                .maxWidth *
                                                            0.05),
                                                    height:
                                                        constraints.maxHeight *
                                                            0.07,
                                                    width:
                                                        constraints.maxWidth *
                                                            0.39,
                                                    //color: Colors.red,
                                                    child: FittedBox(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          current[index]
                                                              .bookname,
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          66,
                                                                          66,
                                                                          86,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        )),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ))
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          //color: Colors.red,
                          height: size.height * 0.45,
                          width: double.infinity,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                children: [
                                  Container(
                                      //color: Colors.purple,
                                      width: constraints.maxWidth,
                                      height: constraints.maxHeight * 0.1,
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              constraints.maxWidth * 0.03),
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: constraints.maxHeight,
                                                width:
                                                    constraints.maxWidth * 0.5,
                                                child: FittedBox(
                                                  alignment: Alignment.topLeft,
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    "Branch",
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.85),
                                                            fontSize: 23)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: constraints.maxHeight,
                                                width:
                                                    constraints.maxWidth * 0.2,
                                                child: FittedBox(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    "view all",
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 15)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      )),
                                  Container(
                                    //color: Colors.red,
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight * 0.08,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            constraints.maxWidth * 0.03),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  indx = 0;
                                                  br = "B.tech cse";
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                height:
                                                    constraints.maxHeight * 0.8,
                                                width: constraints.maxWidth / 5,
                                                decoration: BoxDecoration(
                                                    color: indx == 0
                                                        ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                        : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            constraints
                                                                    .maxHeight *
                                                                0.3)),
                                                child: FittedBox(
                                                    child: Text(
                                                  "Btech cse",
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: indx == 0
                                                              ? Colors.white
                                                              : Color.fromRGBO(
                                                                  171,
                                                                  171,
                                                                  179,
                                                                  1))),
                                                )),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  indx = 1;
                                                  br = "B.pharma";
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                height:
                                                    constraints.maxHeight * 0.8,
                                                width: constraints.maxWidth / 5,
                                                decoration: BoxDecoration(
                                                    color: indx == 1
                                                        ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                        : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            constraints
                                                                    .maxHeight *
                                                                0.3)),
                                                child: FittedBox(
                                                    child: Text(
                                                  "B.pharma",
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: indx == 1
                                                              ? Colors.white
                                                              : Color.fromRGBO(
                                                                  171,
                                                                  171,
                                                                  179,
                                                                  1))),
                                                )),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  indx = 2;
                                                  br = "Geology";
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                height:
                                                    constraints.maxHeight * 0.8,
                                                width: constraints.maxWidth / 5,
                                                decoration: BoxDecoration(
                                                    color: indx == 2
                                                        ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                        : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            constraints
                                                                    .maxHeight *
                                                                0.3)),
                                                child: FittedBox(
                                                    child: Text(
                                                  "Geology",
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: indx == 2
                                                              ? Colors.white
                                                              : Color.fromRGBO(
                                                                  171,
                                                                  171,
                                                                  179,
                                                                  1))),
                                                )),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  indx = 3;
                                                  br = "BCA";
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        constraints.maxHeight *
                                                            0.33),
                                                height:
                                                    constraints.maxHeight * 0.8,
                                                width: constraints.maxWidth / 5,
                                                decoration: BoxDecoration(
                                                    color: indx == 3
                                                        ? Color.fromRGBO(
                                                            66, 66, 86, 1)
                                                        : Color.fromRGBO(
                                                            238, 238, 238, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            constraints
                                                                    .maxHeight *
                                                                0.3)),
                                                child: FittedBox(
                                                    child: Text(
                                                  "BCA",
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: indx == 3
                                                              ? Colors.white
                                                              : Color.fromRGBO(
                                                                  171,
                                                                  171,
                                                                  179,
                                                                  1))),
                                                )),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.031,
                                  ),
                                  Container(
                                      //color: Colors.green,
                                      height: constraints.maxHeight * 0.7,
                                      width: constraints.maxWidth,
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          final Stream<QuerySnapshot>
                                              _bookStream = FirebaseFirestore
                                                  .instance
                                                  .collection('BOOK')
                                                  .where("branch",
                                                      isEqualTo: br)
                                                  .snapshots();

                                          return StreamBuilder<QuerySnapshot>(
                                            stream: _bookStream,
                                            builder: (BuildContext context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (snapshot.hasError) {
                                                return Text(
                                                    'Something went wrong');
                                              }

                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Text("Loading");
                                              }

                                              return new ListView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: snapshot.data.docs
                                                    .map((DocumentSnapshot
                                                        document) {
                                                  return Column(
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            /* final db =
                                                                FirebaseFirestore
                                                                    .instance;
                                                            var result =
                                                                await db
                                                                    .collection(
                                                                        'BOOK')
                                                                    .get();
                                                            result.docs
                                                                .forEach((res) {
                                                              print(res.id);
                                                            });*/
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetailsPage(
                                                                  imageAddress:
                                                                      document[
                                                                          "imagePath"],
                                                                  authorname:
                                                                      document[
                                                                          "authorName"],
                                                                  bookname:
                                                                      document[
                                                                          "bookname"],
                                                                  url: document[
                                                                      "file"],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets.symmetric(
                                                                horizontal:
                                                                    constraints
                                                                            .maxWidth *
                                                                        0.025),
                                                            width: constraints
                                                                    .maxWidth *
                                                                0.35,
                                                            height: constraints
                                                                    .maxHeight *
                                                                0.84,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .circular(constraints
                                                                            .maxHeight *
                                                                        0.081),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: NetworkImage(
                                                                        document[
                                                                            "imagePath"])),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          3,
                                                                      spreadRadius:
                                                                          2,
                                                                      offset:
                                                                          Offset(
                                                                              4,
                                                                              1),
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1))
                                                                ]),
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  bottom: constraints
                                                                          .maxWidth *
                                                                      0.02,
                                                                  left: constraints
                                                                          .maxWidth *
                                                                      0.02,
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            constraints.maxHeight *
                                                                                0.015),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(constraints.maxHeight *
                                                                                0.04)),
                                                                    height: constraints
                                                                            .maxHeight *
                                                                        0.12,
                                                                    width: constraints
                                                                            .maxWidth *
                                                                        0.12,
                                                                    child:
                                                                        FittedBox(
                                                                      child:
                                                                          Text(
                                                                        "⭐ " +
                                                                            document["rating"].toString(),
                                                                        style: GoogleFonts.lato(
                                                                            textStyle:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height: constraints
                                                                .maxHeight *
                                                            0.01,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        height: constraints
                                                                .maxHeight *
                                                            0.07,
                                                        width: constraints
                                                                .maxWidth *
                                                            0.39,
                                                        //color: Colors.red,
                                                        child: FittedBox(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              document[
                                                                  "bookname"],
                                                              style: GoogleFonts.lato(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          66,
                                                                          66,
                                                                          86,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )),
                                                      ),
                                                      Container(
                                                          height: constraints
                                                                  .maxHeight *
                                                              0.05,
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.39,
                                                          //color: Colors.red,
                                                          child: FittedBox(
                                                              child: Text(
                                                            document[
                                                                "authorName"],
                                                            style: GoogleFonts.lato(
                                                                textStyle: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.7))),
                                                          )))
                                                    ],
                                                  );
                                                }).toList(),
                                              );
                                            },
                                          );
                                        },
                                      ))
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
