import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/core/entities/track.dart';
import 'package:flip/features/library/domain/repositories/library_repository.dart';

class GetFavoritesUseCase {
  final LibraryRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<Either<Failure, List<BaseTrack>>> call() async {
    return repository.getFavorites();
  }
}
