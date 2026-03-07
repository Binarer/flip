enum PlaybackState { idle, loading, playing, paused, stopped, error }

class PlayerStateModel {
  final BaseTrack? currentTrack;
  final PlaybackState state;
  final Duration position;
  final Duration duration;
  final bool isShuffle;
  final bool isRepeat;
  final List<BaseTrack> queue;
  final int queueIndex;

  const PlayerStateModel({
    this.currentTrack,
    required this.state,
    required this.position,
    required this.duration,
    this.isShuffle = false,
    this.isRepeat = false,
    required this.queue,
    required this.queueIndex,
  });

  PlayerStateModel copyWith({
    BaseTrack? currentTrack,
    PlaybackState? state,
    Duration? position,
    Duration? duration,
    bool? isShuffle,
    bool? isRepeat,
    List<BaseTrack>? queue,
    int? queueIndex,
  }) {
    return PlayerStateModel(
      currentTrack: currentTrack ?? this.currentTrack,
      state: state ?? this.state,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isShuffle: isShuffle ?? this.isShuffle,
      isRepeat: isRepeat ?? this.isRepeat,
      queue: queue ?? this.queue,
      queueIndex: queueIndex ?? this.queueIndex,
    );
  }
}
