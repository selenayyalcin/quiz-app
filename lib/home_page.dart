import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 171, 87, 182),
        title: const Text(
          'Quiz App',
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    String? userName = await _getUserName(context);
                    if (userName != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(userName: userName)),
                      );
                    }
                  },
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(
                        color: Color.fromARGB(255, 171, 87, 182), fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }

  Future<String?> _getUserName(BuildContext context) async {
    String? name = await showDialog(
      context: context,
      builder: (context) => GetNameDialog(),
    );

    return name;
  }
}

class GetNameDialog extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  GetNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter your name'),
      content: TextField(controller: _nameController),
      actions: [
        ElevatedButton(
          onPressed: () {
            String name = _nameController.text;
            if (name.isNotEmpty) {
              Navigator.pop(context, name);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
