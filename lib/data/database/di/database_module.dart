import 'package:injectable/injectable.dart';
import 'package:tafakkur_test/data/database/src/sqflite.dart';

@module
abstract class DatabaseModule {
  @lazySingleton
  DatabaseService provideDatabaseService() => DatabaseService();
}
