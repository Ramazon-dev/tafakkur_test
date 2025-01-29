import 'app_bloc.dart';
import 'package:get_it/get_it.dart';

mixin AppBlocHelper {
  static CardsCubit getCardsCubit() => GetIt.I.get<CardsCubit>();

  static CardCubit getCardCubit() => GetIt.I.get<CardCubit>();
}
