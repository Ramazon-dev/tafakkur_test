import 'package:tafakkur_test/data/database/src/sqflite.dart';
import 'package:tafakkur_test/domain/model/card_model.dart';

import '../app_bloc.dart';

part 'cards_state.dart';

class CardsCubit extends Cubit<CardsState> {
  final DatabaseService _databaseService;
  CardsCubit(this._databaseService) : super(const CardsInitial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    final res = await _databaseService.fetchCards();
    emit(CardsLoaded(res));
  }

  Future<void> delete(int id) async {
    emit(const CardsLoading());
    await _databaseService.deleteCard(id);
    await fetchData();
  }

  Future<void> update(CardModel card, int id) async {
    emit(const CardsLoading());
    await _databaseService.updateCard(card, id);
    await fetchData();
  }

  Future<void> add(CardModel card) async {
    emit(const CardsLoading());
    await _databaseService.addCard(card);
    await fetchData();
  }
}
