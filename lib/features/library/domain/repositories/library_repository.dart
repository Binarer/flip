import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/core/entities/track.dart';
import 'package:flip/features/library/data/models/library/library.dart';
import 'package:flip/features/library/data/models/playlist/playlist.dart';

abstract class LibraryRepository {
  /// Get full user library.
  Future<Either<Failure, UserLibraryModel>> getUserLibrary();

  /// Get user playlists.
  Future<Either<Failure, List<PlaylistModel>>> getPlaylists();

  /// Get specific playlist by ID.
  Future<Either<Failure, PlaylistModel>> getPlaylist(String id);

  /// Get all favorites.
  Future<Either<Failure, List<BaseTrack>>> getFavorites();

  /// Add track to favorites.
  Future<Either<Failure, void>> addToFavorites(BaseTrack track);

  /// Remove track from favorites.
  Future<Either<Failure, void>> removeFromFavorites(String trackId);
}
