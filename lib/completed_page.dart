import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/leaderboard_page.dart';
import 'package:quiz_app/quiz_page.dart';
// ignore: unused_import
import 'dart:io';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';
// ignore: unused_import
import 'dart:typed_data';
// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
import 'package:quiz_app/review_answer_page.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/score_database.dart';
import 'package:share/share.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobile.dart';

// ignore: must_be_immutable
class Completed extends StatelessWidget {
  final int trueAnswer;
  final int falseAnswer;
  List responseData;
  final List<String>? selectedAnswers;
  final String userName;

  //int score = trueAnswer * 10;

  Completed(
      {super.key,
      required this.falseAnswer,
      required this.trueAnswer,
      required this.responseData,
      required this.selectedAnswers,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 521,
            width: 400,
            child: Stack(
              children: [
                Container(
                  height: 340,
                  width: 410,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 171, 87, 182),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Colors.white.withOpacity(.4),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Your Score',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 103, 31, 112),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '${trueAnswer * 10}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 171, 87, 182),
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: 'pt',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 171, 87, 182),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 22,
                  child: Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: const Color.fromARGB(255, 171, 87, 182)
                              .withOpacity(.7),
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(
                                                  255, 171, 87, 182),
                                            ),
                                          ),
                                          Text(
                                            '%${(trueAnswer + falseAnswer) * 10}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 171, 87, 182),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text('Completion'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(
                                                  255, 171, 87, 182),
                                            ),
                                          ),
                                          const Text(
                                            '10',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 171, 87, 182),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text('Total Question'),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '$trueAnswer',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Colors.green,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text('Correct'),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 48.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '$falseAnswer',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Text('Wrong'),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuizPage(
                                    userName: userName,
                                  ),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 171, 87, 182),
                              radius: 35,
                              child: Center(
                                child: Icon(
                                  Icons.refresh,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Play Again',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewAnswerPage(
                                          responseData: responseData,
                                          trueAnswer: trueAnswer,
                                          falseAnswer: falseAnswer,
                                          selectedAnswers: selectedAnswers,
                                        )),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 171, 87, 182),
                              radius: 35,
                              child: Center(
                                child: Icon(
                                  Icons.visibility_rounded,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Review Answer',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _shareScore(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 171, 87, 182),
                              radius: 35,
                              child: Center(
                                child: Icon(
                                  Icons.share,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Share Score',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 171, 87, 182),
                            radius: 35,
                            child: GestureDetector(
                              onTap: () {
                                _createPDF();
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.file_open_rounded,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Generate PDF',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 171, 87, 182),
                            radius: 35,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.home,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              ScoreDatabase.insertScore(
                                  userName, trueAnswer * 10);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeaderboardPage()));
                            },
                            child: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 171, 87, 182),
                              radius: 35,
                              child: Center(
                                child: Icon(
                                  Icons.settings_applications,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Leaderboard',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _shareScore(BuildContext context) {
    Share.share('My score is: ${trueAnswer * 10}');
  }

  Future<void> _createPDF() async {
    final PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();
    final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 20);

    final PdfGraphics graphics = page.graphics;

    drawScoreScreen(graphics, font);

    final List<int> bytes = document.save();

    document.dispose();

    saveAndLaunchFile(bytes, 'Score.pdf');
  }

  void drawScoreScreen(PdfGraphics graphics, PdfFont font) {
    graphics.drawString('Your Score: ${trueAnswer * 10} pt', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 500, 50));
    graphics.drawString(
      'Correct Answers: $trueAnswer',
      font,
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(50, 80, 200, 20),
    );
    graphics.drawString(
      'Wrong Answers: $falseAnswer',
      font,
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(50, 110, 200, 20),
    );
  }
}
