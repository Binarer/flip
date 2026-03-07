import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/core/entities/track.dart';
import 'package:flip/features/player/data/models/PlayerState/player_state.dart';

abstract class PlayerRepository {
  /// Stream of player state.
  Stream<PlayerStateModel> get playerStateStream;

  /// Play a specific track.
  Future<Either<Failure, void>> play(BaseTrack track);

  /// Play from a queue.
  Future<Either<Failure, void>> playFromQueue(List<BaseTrack> queue, int index);

  /// Pause current track.
  Future<Either<Failure, void>> pause();

  /// Resume playback.
  Future<Either<Failure, void>> resume();

  /// Stop playback.
  Future<Either<Failure, void>> stop();

  /// Seek to position.
  Future<Either<Failure, void>> seek(Duration position);

  /// Skip to next track.
  Future<Either<Failure, void>> next();

  /// Skip to previous track.
  Future<Either<Failure, void>> previous();

  /// Toggle shuffle mode.
  Future<Either<Failure, void>> toggleShuffle();

  /// Toggle repeat mode.
  Future<Either<Failure, void>> toggleRepeat();
}
