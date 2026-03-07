import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/features/library/data/models/playlist/playlist.dart';
import 'package:flip/features/library/domain/repositories/library_repository.dart';

class GetPlaylistsUseCase {
  final LibraryRepository repository;

  GetPlaylistsUseCase(this.repository);

  Future<Either<Failure, List<PlaylistModel>>> call() async {
    return repository.getPlaylists();
  }
}
