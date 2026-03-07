import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/player/domain/repositories/player_repository.dart';

class SkipPreviousUseCase {
  final PlayerRepository repository;

  SkipPreviousUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return repository.previous();
  }
}
