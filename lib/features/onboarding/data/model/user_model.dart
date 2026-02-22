class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  Map<String, String> toMap() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phone': phone,
  };

  factory UserModel.fromMap(Map<String, String?> map) => UserModel(
    firstName: map['firstName'] ?? '',
    lastName: map['lastName'] ?? '',
    email: map['email'] ?? '',
    phone: map['phone'] ?? '',
  );
}