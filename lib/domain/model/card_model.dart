import 'package:flutter/material.dart';
import 'package:tafakkur_test/domain/core/color_ext.dart';

class CardModel {
  final String name;
  final String number;
  final String dateTime;
  final int? id;
  final double blur;
  final String? asset;
  final String? file;
  final Color? color;
  final Gradient? gradient;

  CardModel({
    this.id,
    required this.name,
    required this.number,
    required this.dateTime,
    required this.blur,
    this.file,
    this.asset,
    this.color,
    this.gradient,
  });

  CardModel copyWith({
    String? name,
    String? number,
    String? dateTime,
    int? id,
    String? asset,
    Color? color,
    Gradient? gradient,
    String? file,
    double? blur,
  }) {
    return CardModel(
      id: id ?? this.id,
      number: number ?? this.number,
      dateTime: dateTime ?? this.dateTime,
      color: color ?? this.color,
      name: name ?? this.name,
      asset: asset ?? this.asset,
      gradient: gradient ?? this.gradient,
      file: file ?? this.file,
      blur: blur ?? this.blur,
    );
  }

  Future<Map<String, Object?>> toMap() async {
    // final uInt8List = await file?.readAsBytes();
    return {
      'id': id,
      'name': name,
      'number': number,
      'dateTime': dateTime,
      'color': color?.toHex(),
      'asset': asset,
      'file': file,
      'gradientStart': gradient?.colors.first.toHex(),
      'gradientEnd': gradient?.colors[1].toHex(),
      'blur': blur.toInt(),
    };
  }
}

extension CardExt on Map<String, Object?> {
  Future<CardModel> toCard(Map<String, Object?> data) async {
    final parseColor = data['color'] as String?;
    final color = parseColor != null ? HexColor.fromHex((parseColor)) : null;
    final gradientStart = data['gradientStart'] as String?;
    final gradientEnd = data['gradientEnd'] as String?;
    final gradient = (gradientStart != null && gradientEnd != null)
        ? LinearGradient(
      colors: [
        HexColor.fromHex(gradientStart),
        HexColor.fromHex(gradientEnd),
      ],
    )
        : null;
    return CardModel(
      id: data['id'] as int,
      name: data['name'] as String,
      number: data['number'] as String,
      dateTime: data['dateTime'] as String,
      blur: (data['blur'] as int).toDouble(),
      color: color,
      asset: data['asset'] as String?,
      gradient: gradient,
      file: data['file'] as String?,
    );
  }
}
