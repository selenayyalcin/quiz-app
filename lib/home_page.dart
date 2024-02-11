import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/completed_page.dart';
import 'package:quiz_app/options.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List responseData = [];
  List<String> shuffledOptions = [];
  int number = 0;
  late Timer _timer;
  int _secondRemaining = 15;

  Future api() async {
    final response =
        await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
        updateShuffleOption();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          SizedBox(
              height: 421,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 390,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 180, 66, 66),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 22,
                    child: Container(
                      height: 170,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 3,
                                color: Color.fromARGB(255, 223, 130, 130))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'abc',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                'abc',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )
                            ],
                          ),
                          const Center(
                            child: Text(
                              'Question 3/10',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 180, 66, 66),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(responseData.isNotEmpty
                              ? responseData[number]['question']
                              : ''),
                        ]),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 210,
                    left: 140,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: Center(
                          child: Text(
                        _secondRemaining.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 180, 66, 66),
                            fontSize: 25),
                      )),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 1,
          ),
          Column(
            children: (responseData.isNotEmpty &&
                    responseData[number]['incorrect_answers'] != null)
                ? shuffledOptions.map((option) {
                    return Options(option: option.toString());
                  }).toList()
                : [],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 180, 66, 66),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
              ),
              onPressed: () {
                nextQuestion();
              },
              child: const Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    );
  }

  void nextQuestion() {
    if (number == 9) {
      completed();
    }
    setState(() {
      number += 1;
      updateShuffleOption();
      _secondRemaining = 15;
    });
  }

  void completed() {
    Navigator.pushReplacement(context as BuildContext,
        MaterialPageRoute(builder: (context) => Completed()));
  }

  void updateShuffleOption() {
    setState(() {
      shuffledOptions = shuffleOption([
        responseData[number]['correct_answer'],
        ...(responseData[number]['incorrect_answers'] as List)
      ]);
    });
  }

  List<String> shuffleOption(List<String> option) {
    List<String> shuffledOptions = List.from(option);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondRemaining > 0) {
          _secondRemaining--;
        } else {
          nextQuestion();
          _secondRemaining = 15;
          updateShuffleOption();
        }
      });
    });
  }
}
