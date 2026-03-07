class SoundCloudUser {
  final int id;
  final String username;
  final String fullName;
  final String? avatarUrl;
  final String permalink;

  const SoundCloudUser({
    required this.id,
    required this.username,
    required this.fullName,
    this.avatarUrl,
    required this.permalink,
  });

  factory SoundCloudUser.fromJson(Map<String, dynamic> json) => SoundCloudUser(
    id: json['id'] ?? 0,
    username: json['username'] ?? '',
    fullName: json['full_name'] ?? '',
    avatarUrl: json['avatar_url'],
    permalink: json['permalink'] ?? '',
  );
}
