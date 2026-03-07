import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/features/player/domain/repositories/player_repository.dart';

class SeekUseCase {
  final PlayerRepository repository;

  SeekUseCase(this.repository);

  Future<Either<Failure, void>> call(Duration position) async {
    return repository.seek(position);
  }
}
