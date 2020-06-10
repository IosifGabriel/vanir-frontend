class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;

  User({this.id, this.fullName, this.email, this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber']
    );
  }
}