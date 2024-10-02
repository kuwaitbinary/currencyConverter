class Flag {
  final String countryCode;
  final String url;

  Flag({
    required this.countryCode,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'countryCode': countryCode,
      'url': url,
    };
  }

  factory Flag.fromMap(Map<String, dynamic> map) {
    return Flag(
      countryCode: map['countryCode'],
      url: map['url'],
    );
  }
}
