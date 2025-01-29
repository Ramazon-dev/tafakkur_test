part of 'cards_cubit.dart';

sealed class CardsState {
  const CardsState();
}

final class CardsInitial extends CardsState {
  const CardsInitial();
}

final class CardsLoading extends CardsState {
  const CardsLoading();
}

final class CardsLoaded extends CardsState {
  final List<CardModel> cards;
  const CardsLoaded(this.cards);
}

final class CardsError extends CardsState {
  final String error;
  const CardsError(this.error);
}
