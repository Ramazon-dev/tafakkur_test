// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:tafakkur_test/app/future_home/card_detail_page.dart' as _i1;
import 'package:tafakkur_test/app/future_home/home_page.dart' as _i2;
import 'package:tafakkur_test/app/future_home/main_wrapper.dart' as _i3;
import 'package:tafakkur_test/domain/model/card_model.dart' as _i6;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CardDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CardDetailRouteArgs>(
          orElse: () => const CardDetailRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(
            child: _i1.CardDetailPage(
          key: args.key,
          cardModel: args.cardModel,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    MainWrapper.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i3.MainWrapper()),
      );
    },
  };
}

/// generated route for
/// [_i1.CardDetailPage]
class CardDetailRoute extends _i4.PageRouteInfo<CardDetailRouteArgs> {
  CardDetailRoute({
    _i5.Key? key,
    _i6.CardModel? cardModel,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CardDetailRoute.name,
          args: CardDetailRouteArgs(
            key: key,
            cardModel: cardModel,
          ),
          initialChildren: children,
        );

  static const String name = 'CardDetailRoute';

  static const _i4.PageInfo<CardDetailRouteArgs> page =
      _i4.PageInfo<CardDetailRouteArgs>(name);
}

class CardDetailRouteArgs {
  const CardDetailRouteArgs({
    this.key,
    this.cardModel,
  });

  final _i5.Key? key;

  final _i6.CardModel? cardModel;

  @override
  String toString() {
    return 'CardDetailRouteArgs{key: $key, cardModel: $cardModel}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainWrapper]
class MainWrapper extends _i4.PageRouteInfo<void> {
  const MainWrapper({List<_i4.PageRouteInfo>? children})
      : super(
          MainWrapper.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapper';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
