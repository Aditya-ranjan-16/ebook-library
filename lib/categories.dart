import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './models/data.dart';
import './detailsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryPage extends StatefulWidget {
  int year;
  CategoryPage({this.year});
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Select Branch"),
        ),
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  //color: Colors.red,
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade100, Colors.white],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center
                      //,stops: [0.7,0.9]
                      )),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Card(
                    child: InkWell(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/Btech.png",
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Center(
                            child: Text(
                              "B.Tech",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BooksPage(
                              year: widget.year,
                              branch: "B.tech cse",
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: InkWell(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/pharm.jpg",
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Center(
                            child: Text(
                              "B.Pharma",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BooksPage(
                              year: widget.year,
                              branch: "B.pharma",
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: InkWell(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/geo.jpg",
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Center(
                            child: Text(
                              " Geology",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BooksPage(
                              year: widget.year,
                              branch: "Geology",
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: InkWell(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/bca.jpg",
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: size.width * 0.06,
                          ),
                          Center(
                            child: Text(
                              "BCA",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BooksPage(
                              year: widget.year,
                              branch: "BCA",
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              )),
        ));
  }
}

class BooksPage extends StatefulWidget {
  int year;
  String branch;
  BooksPage({this.year, this.branch});
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    //color: Colors.red,
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.center
                        //,stops: [0.7,0.9]
                        )),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final Stream<QuerySnapshot> _bookStream = FirebaseFirestore
                        .instance
                        .collection('BOOK')
                        .where("year", isEqualTo: widget.year)
                        .where("branch", isEqualTo: widget.branch)
                        .snapshots();
                    List<Booksdata> curr = mainlist
                        .where((f) =>
                            f.year == widget.year && f.branch == widget.branch)
                        .toList();
                    print(curr[0].bookname);

                    return StreamBuilder<QuerySnapshot>(
                        stream: _bookStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }

                          return new GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              childAspectRatio: 0.6,
                              scrollDirection: Axis.vertical,
                              children: snapshot.data.docs
                                  .map((DocumentSnapshot document) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: constraints.maxHeight * 0.02,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            imageAddress: document["imagePath"],
                                            authorname: document["authorName"],
                                            bookname: document["bookname"],
                                            url: document["file"],
                                          ),
                                        ),
                                      ),
                                      child: Hero(
                                        tag: Text("Haha"),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  constraints.maxWidth * 0.025),
                                          width: constraints.maxWidth * 0.6,
                                          height: constraints.maxHeight * 0.3,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      constraints.maxHeight *
                                                          0.02),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      document["imagePath"])),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 3,
                                                    spreadRadius: 2,
                                                    offset: Offset(4, 1),
                                                    color: Colors.black
                                                        .withOpacity(0.1))
                                              ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.01,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.05),
                                      height: constraints.maxHeight * 0.07,
                                      width: constraints.maxWidth * 0.39,
                                      //color: Colors.red,
                                      child: Center(
                                          child: Text(
                                        document["bookname"],
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w500),
                                      )),
                                    ),
                                  ],
                                );
                              }).toList());
                        });
                  },
                ))));
  }
}
