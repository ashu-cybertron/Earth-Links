import 'package:flutter/material.dart';
import 'package:flutter_universe/Neighbourhood/text_widget/earth_widget.dart';
import 'package:flutter_universe/Quiz/quiz_setip.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class QuizQuestions extends StatefulWidget {
  QuizQuestions({Key key}) : super(key: key);

  @override
  _QuizQuestionsState createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationColor,
        centerTitle: true,
        titleSpacing: 3,
        title: Text("Quizz"),
      ),
      body: SingleChildScrollView(
        child: LiquidSwipe(
          pages: quizpages,
          enableLoop: true,
          fullTransitionValue: 600,
          enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
        ),
      ),
    );
  }
}

final quizpages = [
  QuizSetup(
    title:
        "The Luna Programme was a series of unmanned space mission launched by which country?",
    option1: "Soviet Union",
    option2: "United States of America",
    option3: "China",
    option4: "None ",
    tag: 1,
    color: Color(0xF40C4FF),
  ),
  QuizSetup(
    tag: 2,
    title:
        "Which of the following phenomena cannot be observed on the surface of the Moon?",
    option1: "Rising and setting of the Sun",
    option2: "Solar eclipse",
    option3: "Motion of comets",
    option4: "Twinkling of stars ",
    answer: 4,
    color: Color(0xF40C4FF),
  ),
  QuizSetup(
    title:
        "The Luna Programme was a series of unmanned space mission launched by which country?",
    option1: "Soviet Union",
    option2: "United States of America",
    option3: "China",
    option4: "None ",
    tag: 1,
    color: Color(0xF40C4FF),
  ),
];
