class UserModel {
  String? name;
  String? email;
  String username;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  UserModel.login({
    required this.username,
    required this.password,
  });

  void setName(String name) {
    this.name = name;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setPassword(String password) {
    this.password = password;
  }

  String? getName() {
    return name;
  }

  String? getEmail() {
    return email;
  }

  String getUsername() {
    return username;
  }

  String getPassword() {
    return password;
  }
}
