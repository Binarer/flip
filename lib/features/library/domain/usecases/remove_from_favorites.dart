import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/features/library/domain/repositories/library_repository.dart';

class RemoveFromFavoritesUseCase {
  final LibraryRepository repository;

  RemoveFromFavoritesUseCase(this.repository);

  Future<Either<Failure, void>> call(String trackId) async {
    return repository.removeFromFavorites(trackId);
  }
}
