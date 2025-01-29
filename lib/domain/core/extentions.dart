extension StringExt on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension ListExt on List? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}