import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/core/entities/track.dart';
import 'package:flip/features/player/domain/repositories/player_repository.dart';

class PlayTrackUseCase {
  final PlayerRepository repository;

  PlayTrackUseCase(this.repository);

  Future<Either<Failure, void>> call(BaseTrack track) async {
    return repository.play(track);
  }
}
