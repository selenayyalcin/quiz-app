import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/quiz_page.dart';
import 'package:html/parser.dart';

class ReviewAnswerPage extends StatelessWidget {
  final List responseData;
  final int trueAnswer;
  final int falseAnswer;
  final List<String>? selectedAnswers;

  const ReviewAnswerPage(
      {super.key,
      required this.responseData,
      required this.trueAnswer,
      required this.falseAnswer,
      required this.selectedAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 171, 87, 182),
      appBar: AppBar(
        title: const Text('Review Answers'),
        backgroundColor: const Color.fromARGB(255, 171, 87, 182),
      ),
      body: ListView.builder(
        itemCount: responseData.length,
        itemBuilder: (context, index) {
          final question = responseData[index]['question'];
          final correctAnswer = responseData[index]['correct_answer'];

          //final userAnswer = responseData[index]['answer'];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                'Question ${index + 1}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 115, 59, 122),
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${removeHTMLTags(question)}',
                  ),
                  Row(
                    children: [
                      const Text(
                        'Correct Answer: ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 171, 87, 182),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(correctAnswer),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Your Answer: ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 171, 87, 182),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(selectedAnswers?[index] ?? ''),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }

  String removeHTMLTags(String htmlString) {
    final document = parse(htmlString);
    return document.body!.text;
  }
}
