import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
// import 'app/navigation/app_router.dart';
import 'app/app_bloc/app_bloc.dart';
import 'app/app_bloc/bloc_observer.dart';
import 'app/design_system/design_system.dart';
import 'app/navigation/app_router.dart';
import 'di/init.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I.get<AppRouter>();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 780),
        child: MaterialApp.router(
          title: 'Tafakkur test',
          theme: ThemeData(
            actionIconTheme: ActionIconThemeData(
              backButtonIconBuilder: (BuildContext context) => const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: appRouter.config(),
          builder: (context, child) {
            return FlavorBanner(
              name: 'name',
              show: true,
              child: child,
            );
          },
        ),
      ),
    );
  }
}

class FlavorBanner extends StatelessWidget {
  final String name;
  final bool show;
  final Widget? child;

  const FlavorBanner({
    super.key,
    required this.name,
    required this.show,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            location: BannerLocation.topStart,
            message: name,
            color: Colors.green.withOpacity(0.6),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
              letterSpacing: 1.0,
            ),
            child: child,
          )
        : child!;
  }
}
