import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Options extends StatelessWidget {
  final String option;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const Options({
    Key? key,
    required this.option,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 325,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 3,
              color: const Color.fromARGB(255, 171, 87, 182),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    option,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Radio<String>(
                    value: option,
                    groupValue: groupValue,
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
