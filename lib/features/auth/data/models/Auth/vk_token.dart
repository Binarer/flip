class VKToken {
  final String accessToken;
  final int userId;
  final int expiresIn; // секунды
  final DateTime expiresAt;
  final List<String> scopes;

  VKToken({
    required this.accessToken,
    required this.userId,
    required this.expiresIn,
    required this.scopes,
    DateTime? expiresAt,
  }) : expiresAt = expiresAt ?? DateTime.now().add(Duration(seconds: expiresIn));

  bool get isValid => !isExpired && accessToken.isNotEmpty;
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  factory VKToken.fromJson(Map<String, dynamic> json) => VKToken(
    accessToken: json['access_token'] ?? '',
    userId: json['user_id'] ?? 0,
    expiresIn: json['expires_in'] ?? 0,
    scopes: List<String>.from((json['scope'] ?? '').split(',')..remove('')),
    expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at'] as String) : null,
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'user_id': userId,
    'expires_in': expiresIn,
    'scope': scopes.join(','),
    'expires_at': expiresAt.toIso8601String(),
  };
}
