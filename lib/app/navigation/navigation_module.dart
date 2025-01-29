import 'package:injectable/injectable.dart';

import 'app_router.dart';

@module
abstract class NavigationModule {
  @lazySingleton
  AppRouter provideAppRouter() => AppRouter();
}
