class Post {
  String id;
  String title;
  String country;
  String city;
  String description;

  Post({required this.id, required this.country, required this.description, required this.city, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'country': country,
      'city': city,
    };
  }

  static Post fromMap(String id, Map<String, dynamic> map) {
    return Post(
      id: id,
      title: map['title'] as String ?? 'title',
      description: map['description'] as String ?? '',
      country: map['country'] as String ?? 'no country',
      city: map['city'] as String ?? 'no city',
    );
  }
}