import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tafakkur_test/domain/model/card_model.dart';

class DatabaseService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'ramazons_db.db');
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) async {
        await db.execute("PRAGMA max_page_size = 10485760;");
        await db.execute("PRAGMA cache_size = -2000;");
        return db.execute(
          '''CREATE TABLE cards(
          id INTEGER PRIMARY KEY, 
          name TEXT NOT NULL,
          number TEXT NOT NULL,
          dateTime TEXT NOT NULL,
          blur INTEGER NOT NULL,
          asset TEXT,
          color TEXT,
          file TEXT,
          gradientStart TEXT,
          gradientEnd TEXT)''',
        );
      },
      version: 5,
    );
    return database;
  }

  Future<void> deleteCard(int id) async {
    final db = await database;
    final result = await db.delete(
      'cards',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('object delete card result database $result');
  }

  Future<void> addCard(CardModel card) async {
    final map = await card.toMap();
    final db = await database;
    final result = await db.insert(
      'cards',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('object add card result database $result');
  }

  Future<void> updateCard(CardModel card, int id) async {
    final db = await database;
    final map = await card.toMap();
    final result = await db.update('cards', map);
    print('object update card result database $result');
  }

  Future<List<CardModel>> fetchCards() async {
    final List<CardModel> cards = [];
    final db = await database;
    final result = await db.query('cards');
    for (final item in result) {
      final some = await item.toCard(item);
      cards.add(some);
    }
    print('object fetch card result database $result');
    return cards;
  }
}
