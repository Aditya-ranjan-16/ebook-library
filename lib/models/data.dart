class Booksdata {
  var bookname;
  var authorName;
  var imagePath;
  var percentageCompleted;
  var rating;
  var branch;
  var year;
  Booksdata(
      {this.authorName,
      this.bookname,
      this.percentageCompleted,
      this.imagePath,
      this.rating,
      this.year,
      this.branch});
}

final List<Booksdata> mainl = [];
List<Booksdata> continueReading = [
  Booksdata(
      bookname: "BASIC ELECTRICAL ENGINEERING",
      authorName: "V.V.S Madhuri",
      percentageCompleted: 30,
      imagePath: 'assets/images/electrical.jpg',
      branch: "B.tech cse",
      year: 2),
  Booksdata(
      bookname: "Programming in ANSI C",
      authorName: "E.Balagurusamy",
      percentageCompleted: 28,
      imagePath: 'assets/images/C.jpg',
      branch: "B.tech cse",
      year: 1),
];

List<Booksdata> mainlist = [
  Booksdata(
      bookname: "BASIC ELECTRICAL ENGINEERING",
      authorName: "V.V.S Madhuri",
      percentageCompleted: 30,
      rating: 5.0,
      imagePath: 'assets/images/electrical.jpg',
      branch: "B.tech cse",
      year: 2),
  Booksdata(
      bookname: "Programming in ANSI C",
      authorName: "E.Balagurusamy",
      percentageCompleted: 28,
      rating: 5.0,
      imagePath: 'assets/images/C.jpg',
      branch: "B.tech cse",
      year: 1),
  Booksdata(
      bookname: "Computer organization and architecture",
      authorName: "William Stallings",
      percentageCompleted: 0,
      imagePath: 'assets/images/ca.jpg',
      rating: 4.8,
      branch: "B.tech cse",
      year: 3),
  Booksdata(
      bookname: "Data structure and algorithm",
      authorName: "John Bullinaria",
      percentageCompleted: 0,
      imagePath: 'assets/images/ds.jpg',
      rating: 4.5,
      branch: "B.tech cse",
      year: 4),
  Booksdata(
      bookname: "A practical book of pharmaceutical analysis",
      authorName: "Dr. K.s. jain",
      percentageCompleted: 0,
      imagePath: 'assets/images/pharma.jpg',
      rating: 5.0,
      branch: "B.pharma",
      year: 1),
  Booksdata(
      bookname: "A practical book of pharmaceutical Organic Chemistry || ",
      authorName: "Swati G.Patil",
      percentageCompleted: 0,
      imagePath: 'assets/images/pharma2.jpg',
      rating: 5.0,
      branch: "B.pharma",
      year: 2),
  Booksdata(
      bookname: "Communication skills",
      authorName: "Sambhaji K. Budhavale",
      percentageCompleted: 0,
      imagePath: 'assets/images/pharma3.jpg',
      rating: 5.0,
      branch: "B.pharma",
      year: 3),
  Booksdata(
      bookname: "Drugs in Pharmacology",
      authorName: "Krusha k.Zambare",
      percentageCompleted: 0,
      imagePath: 'assets/images/pharma4.jpg',
      rating: 5.0,
      branch: "B.pharma",
      year: 4),
  Booksdata(
      bookname: " Elements Of Mathematical Foundations",
      authorName: "JEEVANSONS PUBLICATIONS",
      percentageCompleted: 0,
      imagePath: 'assets/images/BCA1.jpg',
      rating: 5.0,
      branch: "BCA",
      year: 1),
  Booksdata(
      bookname: "Opearting System",
      authorName: "Geetha",
      percentageCompleted: 0,
      imagePath: 'assets/images/BCAo.jpg',
      rating: 5.0,
      branch: "BCA",
      year: 2),
  Booksdata(
      bookname: "Computer networking",
      authorName: "VISION PUBLICATIONS",
      percentageCompleted: 0,
      imagePath: 'assets/images/BCA3.jpg',
      rating: 5.0,
      branch: "BCA",
      year: 3),
  Booksdata(
      bookname: " Applied and Discrete Mathematics",
      authorName: "SHARMA PUBLICATIONS",
      percentageCompleted: 0,
      imagePath: 'assets/images/BCA4.jpg',
      rating: 5.0,
      branch: "BCA",
      year: 4),
  Booksdata(
      bookname: "Geology: A Complete Introduction ",
      authorName: "David Rothery",
      percentageCompleted: 0,
      imagePath: 'assets/images/geo1.jpg',
      rating: 5.0,
      branch: "Geology",
      year: 1),
  Booksdata(
      bookname: "Textbook Of Physical Geology",
      authorName: "G.B. Mahapatra",
      percentageCompleted: 0,
      imagePath: 'assets/images/geo2.jpg',
      rating: 5.0,
      branch: "Geology",
      year: 2),
  Booksdata(
      bookname: "Crystallography and mineralogy",
      authorName: "Ram S.Sharma",
      percentageCompleted: 0,
      imagePath: 'assets/images/geo3.jpg',
      rating: 5.0,
      branch: "Geology",
      year: 3),
  Booksdata(
      bookname: "Economic mineral deposits ",
      authorName: "MEAD L. JENSEN AND ALAN M. BATEMAN",
      percentageCompleted: 0,
      imagePath: 'assets/images/geo4.jpg',
      rating: 5.0,
      branch: "Geology",
      year: 4),
];
