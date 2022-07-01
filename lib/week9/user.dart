class User {
  final String email;
  final String password;
  final String name;

  User(this.email, this.password, this.name);

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': password,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && email == other.email && password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
