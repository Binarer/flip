class PlaylistModel {
  final String id;
  final String title;
  final String? description;
  final String? artworkUrl;
  final int trackCount;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final SourceType source;
  final List<BaseTrack> tracks;

  const PlaylistModel({
    required this.id,
    required this.title,
    this.description,
    this.artworkUrl,
    required this.trackCount,
    required this.createdAt,
    this.updatedAt,
    required this.source,
    required this.tracks,
  });
}

