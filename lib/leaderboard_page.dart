import 'package:flutter/material.dart';
import 'package:quiz_app/score_database.dart';
import 'package:quiz_app/score_model.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Score score = snapshot.data![index];
              return ListTile(
                title: Text(score.name),
                subtitle: Text('Score: ${score.score}'),
              );
            },
          );
        },
      ),
    );
  }
}
