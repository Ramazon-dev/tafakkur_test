import 'package:tafakkur_test/data/database/src/sqflite.dart';

import '../app_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppCubitModule {
  CardsCubit provideCardsCubit(DatabaseService database) =>
      CardsCubit(database);

  CardCubit provideCardCubit() => CardCubit();
}
