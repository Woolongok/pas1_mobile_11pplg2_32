class Favorite {
  final int? id;
  final String name;
  final String email;

  Favorite({this.id, required this.name, required this.email});

  factory Favorite.fromMap(Map<String, dynamic> json) => Favorite(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
