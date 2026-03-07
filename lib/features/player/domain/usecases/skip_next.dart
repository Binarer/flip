import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/features/player/domain/repositories/player_repository.dart';

class SkipNextUseCase {
  final PlayerRepository repository;

  SkipNextUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return repository.next();
  }
}
