import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:code_challenge/features/supported_currencies/domain/entities/currency.dart';

class LocalCurrencyDataSource {
  static final LocalCurrencyDataSource _instance = LocalCurrencyDataSource._internal();
  static Database? _database;

  factory LocalCurrencyDataSource() {
    return _instance;
  }

  LocalCurrencyDataSource._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'currency_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE currencies (
            code TEXT PRIMARY KEY,
            name TEXT
          )
        ''');
      },
    );
  }

  Future<void> cacheCurrencies(List<Currency> currencies) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('currencies');
      for (var currency in currencies) {
        await txn.insert('currencies', currency.toMap());
      }
    });
  }

  Future<List<Currency>> getLastCurrencies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('currencies');
    return List.generate(maps.length, (i) {
      return Currency.fromMap(maps[i]);
    });
  }
}
