import 'package:flutter/material.dart';
import 'package:quiz_app/score_database.dart';
import 'package:quiz_app/score_model.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 171, 87, 182),
      appBar: AppBar(
          title: const Text('Leaderboard'),
          backgroundColor: const Color.fromARGB(255, 171, 87, 182)),
      body: FutureBuilder<List<Score>>(
        future: ScoreDatabase.getScores(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No scores found.');
          }

          final List<String> addedNames = [];
          int number = 0;

          snapshot.data!.sort((a, b) => b.score.compareTo(a.score));

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Score score = snapshot.data![index];

              if (!addedNames.contains(score.name)) {
                addedNames.add(score.name);
                number++;
                return ListTile(
                  leading: Text(
                    '$number.',
                    style: const TextStyle(fontSize: 18),
                  ),
                  title: Text(score.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  subtitle: Text('Score: ${score.score}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              } else {
                return const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
