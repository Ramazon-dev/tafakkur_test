import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tafakkur_test/app/app_bloc/app_bloc.dart';

@RoutePage()
class MainWrapper extends AutoRouter implements AutoRouteWrapper {
  const MainWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBlocHelper.getCardsCubit(),
          lazy: false,
        ),
      ],
      child: this,
    );
  }
}
