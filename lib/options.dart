import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Options extends StatelessWidget {
  String option;
  Options({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: Colors.black)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    option,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Radio(value: option, groupValue: 2, onChanged: (val) {})
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
