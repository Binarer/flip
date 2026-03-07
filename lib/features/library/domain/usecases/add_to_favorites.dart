import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/core/entities/track.dart';
import 'package:flip/features/library/domain/repositories/library_repository.dart';

class AddToFavoritesUseCase {
  final LibraryRepository repository;

  AddToFavoritesUseCase(this.repository);

  Future<Either<Failure, void>> call(BaseTrack track) async {
    return repository.addToFavorites(track);
  }
}
