import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ReadingPage extends StatefulWidget {
  final String bookname;

  final File file;
  ReadingPage({this.bookname, this.file});
  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  PDFViewController controller;
  int pages = 3;
  int indexPage = 0;
  bool night = false;
  double slider = 1;
  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} of $pages';

    var size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              height: size.height * 0.045,
              width: size.width,
              //color: Colors.red,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(constraints.maxHeight * 0.18),
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth * 0.15,
                          child: FittedBox(
                              child: Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromRGBO(66, 66, 86, 1),
                          )),
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        height: constraints.maxHeight * 0.70,
                        width: constraints.maxWidth * 0.51,
                        child: Container(
                          // padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*),
                          //color: Colors.purple,
                          height: constraints.maxHeight * 0.85 * 0.7,
                          width: constraints.maxWidth * 0.35,
                          child: FittedBox(
                              child: Text(
                            widget.bookname,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 33,
                              color: Color.fromRGBO(66, 66, 86, 1),
                            )),
                          )),
                        ),
                      ),
                      Container(
                        //color: Colors.amber,
                        height: size.height * 0.02,
                        child: Center(
                            child: Text(
                          text,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(101, 101, 101, 1)
                                      .withOpacity(0.7))),
                        )),
                      ),
                      SizedBox(),
                    ],
                  );
                },
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Colors.black)),
                ),

                //color: Colors.red,
                height: size.height * 0.826811,
                width: size.width,
                child: PDFView(
                  filePath: widget.file.path,
                  autoSpacing: false,
                  enableSwipe: true,
                  pageSnap: false,
                  pageFling: true,
                  onRender: (pages) {
                    setState(() {
                      this.pages = pages;
                    });
                  },
                  onError: (error) {
                    print(error.toString());
                  },
                  onViewCreated: (controller) =>
                      setState(() => this.controller = controller),
                  onPageChanged: (indexPage, _) => setState(() {
                    this.indexPage = indexPage;
                    slider = (indexPage + 1).toDouble();
                  }),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height * 0.006)),
                height: size.height * 0.006,
                width: size.width * 0.93,
                child: Stack(
                  children: [
                    Slider(
                      activeColor: Color.fromRGBO(69, 69, 88, 1),
                      inactiveColor: Color.fromRGBO(69, 69, 88, 1),
                      min: 1,
                      max: pages.toDouble(),
                      divisions: pages,
                      value: slider,
                      onChanged: (val) {
                        setState(() {
                          slider = val;
                        });
                        controller.setPage(val.toInt());
                      },
                      label: slider.toInt().toString(),
                    ),
                  ],
                )),
            SizedBox(
              height: size.height * 0.008,
            ),
            Container(
              //color: Colors.amber,
              height: size.height * 0.06,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: FittedBox(
                                child: Icon(
                              Icons.book,
                              color: Color.fromRGBO(69, 69, 88, 1),
                            )),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {
                            final page = indexPage == 0 ? pages : indexPage - 1;
                            controller.setPage(page);
                          },
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: FittedBox(
                                child: Icon(
                              Icons.chevron_left_sharp,
                              color: Color.fromRGBO(69, 69, 88, 1),
                            )),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {
                            final page =
                                indexPage == pages - 1 ? 0 : indexPage + 1;
                            controller.setPage(page);
                          },
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: FittedBox(
                                child: Icon(
                              Icons.chevron_right_sharp,
                              color: Color.fromRGBO(69, 69, 88, 1),
                            )),
                          ),
                        ),
                      ),
                      Material(
                        color: night == false ? null : Colors.grey,
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight * 0.45),
                        child: InkWell(
                          onTap: () {
                            if (night == false) {
                              setState(() {
                                night = true;
                              });
                            } else {
                              setState(() {
                                night = false;
                              });
                            }
                          },
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45 / 2),
                          //splashColor: Colors.grey,
                          child: Container(
                            height: constraints.maxHeight * 0.45,
                            width: constraints.maxWidth * 0.9 / 5,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2)),
                            child: FittedBox(
                                child: Icon(
                              Icons.brightness_3,
                              color: night == false
                                  ? Color.fromRGBO(191, 191, 191, 1)
                                  : Colors.black,
                            )),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
