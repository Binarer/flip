class VKToken {
  final String accessToken;
  final int userId;
  final int expiresIn; // секунды
  final DateTime expiresAt;
  final List<String> scopes;

  const VKToken({
    required this.accessToken,
    required this.userId,
    required this.expiresIn,
    required this.scopes,
  }) : expiresAt = DateTime.now().add(Duration(seconds: expiresIn));

  bool get isValid => !isExpired && accessToken.isNotEmpty;
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  factory VKToken.fromJson(Map<String, dynamic> json) => VKToken(
    accessToken: json['access_token'] ?? '',
    userId: json['user_id'] ?? 0,
    expiresIn: json['expires_in'] ?? 0,
    scopes: List<String>.from((json['scope'] ?? '').split(',')..remove('')),
  );
}
