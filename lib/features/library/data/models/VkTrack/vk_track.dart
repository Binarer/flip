import 'package:flip/core/entities/track.dart';

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

