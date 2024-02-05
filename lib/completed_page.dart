import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 521,
          width: 400,
          child: Stack(children: [
            Container(
              height: 340,
              width: 410,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: '100',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      children: [
                                    TextSpan(
                                        text: 'pt',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black))
                                  ])),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 60,
                left: 22,
                child: Container(
                  height: 190,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 3,
                            color: Colors.red.withOpacity(.7),
                            offset: const Offset(0, 1))
                      ]),
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
                                            color: Colors.black),
                                      ),
                                      const Text(
                                        '100%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.red),
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
                                            color: Colors.black),
                                      ),
                                      const Text(
                                        '10',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.red),
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
                                            color: Colors.green),
                                      ),
                                      const Text(
                                        '07',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.green),
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
                                              color: Colors.red),
                                        ),
                                        const Text(
                                          '03',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Colors.red),
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
                    )),
                  ),
                ))
          ]),
        )
      ]),
    );
  }
}
