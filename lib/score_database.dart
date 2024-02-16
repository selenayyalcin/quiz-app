import 'package:quiz_app/score_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';

class ScoreDatabase {
  static late Database _database;

  static Future<void> initialize() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'score_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE scores(id INTEGER PRIMARY KEY, name TEXT, score INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertScore(String name, int score) async {
    await _database.insert(
      'scores',
      {'name': name, 'score': score},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Score>> getScores() async {
    final List<Map<String, dynamic>> scoreMaps =
        await _database.query('scores');

    return List.generate(scoreMaps.length, (i) {
      return Score(
        id: scoreMaps[i]['id'],
        name: scoreMaps[i]['name'],
        score: scoreMaps[i]['score'],
      );
    });
  }

  static Future<void> updateScore(String name, int score) async {
    List<Score> scores = await getScores();
    Score? existingScore = scores.firstWhereOrNull((s) => s.name == name);
    if (existingScore != null) {
      await _database.update(
        'scores',
        {'score': score},
        where: 'name = ?',
        whereArgs: [name],
      );
    } else {
      await insertScore(name, score);
    }
  }
}
