import 'package:flutter/material.dart';
import 'package:flutter_universe/Quiz/quizQuestions.dart';
import 'package:flutter_universe/data/constants.dart';

class QuizHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        backgroundColor: navigationColor,
        title: Center(
            child: Text(
          "QUIZ",
          style: TextStyle(letterSpacing: 3),
        )),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'How Good do you know about SPACE ? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 20),
                  child: Card(
                    color: Colors.grey[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'I AM A BEGINNER',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AvailQuiz())),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
                child: Card(
                    color: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'I AM INTERMEDIATE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 27),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 20),
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'I AM AN EXPERT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}

class AvailQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationColor,
        title: Center(
            child: Text(
          "QUIZ",
          style: TextStyle(letterSpacing: 3),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardEvents(
              title: 'QUIZZ FOR KIDS',
              tag: 1,
            ),
            CardEvents(
              title: 'Black Holes',
            ),
            CardEvents(
              title: 'Star Wars',
            ),
            CardEvents(
              title: 'Solar System',
            ),
          ],
        ),
      ),
    );
  }
}

class CardEvents extends StatelessWidget {
  final String title;

  final int tag;

  const CardEvents({Key key, this.title, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              title,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    Icon(
                      Icons.event_note,
                      color: Colors.black,
                      size: 60,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          if (tag == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuizQuestions()));
          }
        },
      ),
    );
  }
}
