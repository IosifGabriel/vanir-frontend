class User {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String avatar;

  User({this.id, this.fullName, this.email, this.phoneNumber, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      avatar: json['avatarUrl']);
  }
}
