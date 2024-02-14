import 'package:flutter/material.dart';
import 'package:quiz_app/score_database.dart';
import 'package:quiz_app/score_model.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: Container(
        color: Color.fromARGB(255, 199, 149, 206),
        child: FutureBuilder<List<Score>>(
          future: ScoreDatabase.getScores(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No scores found.'),
              );
            }

            snapshot.data!.sort((a, b) => b.score.compareTo(a.score));

            return Center(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Score score = snapshot.data![index];
                  return ListTile(
                    leading: Text(
                      '${index + 1}.',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      score.name.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Score: ${score.score}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    tileColor:
                        index % 2 == 0 ? Colors.white : Colors.grey.shade200,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
