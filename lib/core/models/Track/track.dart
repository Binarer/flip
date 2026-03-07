abstract class BaseTrack {
  final String id;
  final String title;
  final String artist;
  final String? artworkUrl;
  final Duration? duration;
  final SourceType source;
  final String? streamUrl;

  const BaseTrack({
    required this.id,
    required this.title,
    required this.artist,
    this.artworkUrl,
    this.duration,
    required this.source,
    this.streamUrl,
  });
}

enum SourceType { vk, soundcloud }

class VKTrack extends BaseTrack {
  final int ownerId;
  const VKTrack({
    required super.id,
    required super.title,
    required super.artist,
    super.artworkUrl,
    super.duration,
    super.streamUrl,
    required this.ownerId,
    super.source = SourceType.vk,
  });

  factory VKTrack.fromJson(Map<String, dynamic> json) => VKTrack(
    id: json['id'].toString(),
    title: json['title'] ?? '',
    artist: json['artist'] ?? '',
    artworkUrl: json['album_art'] ?? json['thumb'] ?? '',
    duration: Duration(milliseconds: (json['duration'] ?? 0) as int),
    streamUrl: json['url'],
    ownerId: json['owner_id'] ?? 0,
  );
}

class SoundCloudTrack extends BaseTrack {
  final String permalinkUrl;
  final String streamUrl;
  final int userId;

  const SoundCloudTrack({
    required super.id,
    required super.title,
    required super.artist,
    required super.artworkUrl,
    required super.duration,
    required super.source,
    required this.permalinkUrl,
    required this.streamUrl,
    required this.userId,
  });
}
