class VKUser {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String? photoUrl;
  final String accessToken;

  const VKUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.accessToken,
    this.photoUrl,
  }) : fullName = '$firstName $lastName';

  factory VKUser.fromJson(Map<String, dynamic> json) => VKUser(
    id: json['id'] ?? 0,
    firstName: json['first_name'] ?? '',
    lastName: json['last_name'] ?? '',
    photoUrl: json['photo_200'] ?? json['photo_100'] ?? '',
    accessToken: '', // токен хранится отдельно в VKToken
  );
}
