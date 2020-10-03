import 'package:flutter/material.dart';

class QuizSetup extends StatefulWidget {
  final String title;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int tag;
  final Color color;
  final int answer;

  const QuizSetup(
      {Key key,
      this.title,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.tag,
      this.color,
      this.answer})
      : super(key: key);

  @override
  _QuizSetupState createState() => _QuizSetupState();
}

class _QuizSetupState extends State<QuizSetup> {
  int set = 0;
  void changeset() {
    setState(() {
      set = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height / 4,
                  width: double.infinity,
                  child: Text(
                    "${widget.tag}) ${widget.title}",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: size.height / 7,
                    width: size.width / 2.7,
                    child: Center(
                        child: Text(
                      "A. ${widget.option1}",
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
                SizedBox(width: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: size.height / 7,
                    width: size.width / 2.7,
                    child: Center(
                        child: Text(
                      "B. ${widget.option2}",
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: size.height / 7,
                    width: size.width / 2.7,
                    child: Center(
                        child: Text(
                      "C. ${widget.option3}",
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                    child: Card(
                      color: set == 0 ? Colors.white : Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: size.height / 7,
                        width: size.width / 2.7,
                        child: Center(
                            child: Text(
                          "D. ${widget.option4}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: set == 0 ? Colors.black : Colors.white,
                          ),
                        )),
                      ),
                    ),
                    onTap: () {
                      changeset();
                    }),
              ],
            ),
            SizedBox(height: 30),
            InkWell(
                child: Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: size.height / 13,
                    width: size.width / 2.7,
                    child: Center(
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
