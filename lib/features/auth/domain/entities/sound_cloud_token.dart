class SoundCloudToken {
  final String accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final DateTime expiresAt;

  const SoundCloudToken({
    required this.accessToken,
    this.refreshToken,
    this.expiresIn,
    required this.expiresAt,
  });

  bool get isValid => !isExpired && accessToken.isNotEmpty;
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  factory SoundCloudToken.fromJson(Map<String, dynamic> json) => SoundCloudToken(
    accessToken: json['access_token'] ?? '',
    refreshToken: json['refresh_token'],
    expiresIn: json['expires_in'],
    expiresAt: DateTime.now().add(Duration(seconds: json['expires_in'] ?? 3600)),
  );
}
