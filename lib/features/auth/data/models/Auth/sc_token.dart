class SoundCloudToken {
  final String accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final DateTime expiresAt;

  SoundCloudToken({
    required this.accessToken,
    this.refreshToken,
    this.expiresIn,
  }) : expiresAt = DateTime.now().add(Duration(seconds: expiresIn ?? 3600));

  bool get isValid => !isExpired && accessToken.isNotEmpty;
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  factory SoundCloudToken.fromJson(Map<String, dynamic> json) => SoundCloudToken(
    accessToken: json['access_token'] ?? '',
    refreshToken: json['refresh_token'],
    expiresIn: json['expires_in'],
  );
}
