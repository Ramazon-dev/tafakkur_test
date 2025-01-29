// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../app/app_bloc/app_bloc.dart' as _i434;
import '../app/app_bloc/di/bloc_module.dart' as _i388;
import '../app/navigation/app_router.dart' as _i388;
import '../app/navigation/navigation_module.dart' as _i256;
import '../data/database/di/database_module.dart' as _i459;
import '../data/database/src/sqflite.dart' as _i168;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appCubitModule = _$AppCubitModule();
    final navigationModule = _$NavigationModule();
    final databaseModule = _$DatabaseModule();
    gh.factory<_i434.CardCubit>(() => appCubitModule.provideCardCubit());
    gh.lazySingleton<_i388.AppRouter>(
        () => navigationModule.provideAppRouter());
    gh.lazySingleton<_i168.DatabaseService>(
        () => databaseModule.provideDatabaseService());
    gh.factory<_i434.CardsCubit>(
        () => appCubitModule.provideCardsCubit(gh<_i168.DatabaseService>()));
    return this;
  }
}

class _$AppCubitModule extends _i388.AppCubitModule {}

class _$NavigationModule extends _i256.NavigationModule {}

class _$DatabaseModule extends _i459.DatabaseModule {}
