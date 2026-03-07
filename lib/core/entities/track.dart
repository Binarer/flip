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
