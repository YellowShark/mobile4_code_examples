class University {
  final String name;
  final String country;
  final String webPage;

  University({
    required this.name,
    required this.country,
    required this.webPage,
  });

  @override
  String toString() {
    return 'University{name: $name, country: $country, webPage: $webPage}';
  }

  factory University.fromJson(Map<String, dynamic> json) => University(
        name: json['name'],
        country: json['country'],
        webPage: (json['web_pages'] as List<dynamic>?)?.first ?? '',
      );
}
