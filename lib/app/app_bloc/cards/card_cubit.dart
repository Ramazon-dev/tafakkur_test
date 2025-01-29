import 'package:flutter/material.dart';
import 'package:tafakkur_test/domain/model/card_model.dart';

import '../app_bloc.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardModel> {
  CardCubit() : super(CardModel(name: '', number: '', dateTime: '', blur: 0));

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeCardNumber(String cardNumber) {
    emit(state.copyWith(number: cardNumber));
  }

  void changeDate(String date) {
    emit(state.copyWith(dateTime: date));
  }

  void changeAsset(String asset) {
    emit(state.copyWith(asset: asset, gradient: null, color: null, file: null));
  }

  void changeFile(String file) {
    emit(state.copyWith(file: file, asset: null, gradient: null, color: null));
  }

  void changeColor(Color color) {
    emit(state.copyWith(color: color, asset: null, gradient: null, file: null));
  }

  void changeBlur(double blur) {
    emit(state.copyWith(blur: blur));
  }

  void changeGradient(Gradient gradient) {
    emit(
      state.copyWith(gradient: gradient, asset: null, file: null, color: null),
    );
  }

  void fetchData({
    required String name,
    required String number,
    required String date,
    required double blur,
    Gradient? gradient,
    Color? color,
    int? id,
    String? asset,
    String? file,
  }) {
    emit(
      state.copyWith(
        name: name,
        blur: blur,
        number: number,
        dateTime: date,
        gradient: gradient,
        color: color,
        id: id,
        asset: asset,
        file: file,
      ),
    );
    nameController.text = name;
    cardNumberController.text = number;
    dateController.text = date;
  }
}
