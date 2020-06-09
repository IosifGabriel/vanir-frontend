import 'package:vanir_app/models/user_model.dart';

class AuthService {
  static Stream<User> get user {
    return Stream.fromFuture(getUser("")) ;
  }

  static Future<User> getUser(String id) async {
    // return User(id: "test_id");
    return null;
  }
}