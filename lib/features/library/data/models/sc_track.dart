import 'package:flip/core/entities/track.dart';

class SoundCloudTrack extends BaseTrack {
  final String permalinkUrl;
  final String? waveformUrl;
  final int userId;

  const SoundCloudTrack({
    required super.id,
    required super.title,
    required super.artist,
    super.artworkUrl,
    super.duration,
    required super.source,
    required this.permalinkUrl,
    super.streamUrl,
    required this.userId,
    this.waveformUrl,
  });

  factory SoundCloudTrack.fromJson(Map<String, dynamic> json) => SoundCloudTrack(
    id: json['id'].toString(),
    title: json['title'] ?? '',
    artist: json['user']?['username'] ?? '',
    artworkUrl: json['artwork_url'],
    duration: Duration(milliseconds: (json['duration'] ?? 0) as int),
    source: SourceType.soundcloud,
    permalinkUrl: json['permalink_url'] ?? '',
    streamUrl: json['stream_url'],
    userId: json['user_id'] ?? 0,
    waveformUrl: json['waveform_url'],
  );
}