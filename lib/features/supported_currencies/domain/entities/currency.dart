class Currency {
  final String code;
  final String name;

  Currency({
    required this.code,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      code: map['code'],
      name: map['name'],
    );
  }
}
