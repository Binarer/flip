import 'package:flip/core/entities/track.dart';
import 'package:flip/features/library/data/models/playlist/playlist.dart';

class UserLibraryModel {
  final List<PlaylistModel> playlists;
  final List<BaseTrack> favorites;
  final int totalTracks;

  const UserLibraryModel({
    required this.playlists,
    required this.favorites,
    required this.totalTracks,
  });
}
