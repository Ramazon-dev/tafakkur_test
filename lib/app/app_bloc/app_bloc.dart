export 'package:flutter_bloc/flutter_bloc.dart';
export 'cards/cards_cubit.dart';
export 'cards/card_cubit.dart';
export 'app_bloc_helper.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';

class AppBloc {
  AppBloc._();

  AppBloc.init() {
    _init();
  }

  void _init() {
    if (kDebugMode) {
      Bloc.observer = AppBlocObserver();
    }
  }
}
