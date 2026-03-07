import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/auth/domain/repositories/sc_auth_repository.dart';
import 'package:flip/features/auth/domain/repositories/vk_auth_repository.dart';

class LogoutUseCase {
  final VKAuthRepository vkRepository;
  final SoundCloudAuthRepository scRepository;

  LogoutUseCase({
    required this.vkRepository,
    required this.scRepository,
  });

  Future<Either<Failure, void>> call() async {
    // Execute both logouts in parallel and aggregate results
    final results = await Future.wait([
      vkRepository.logout(),
      scRepository.logout(),
    ]);

    final vkResult = results[0];
    final scResult = results[1];

    // If both succeed, return success
    if (vkResult.isRight() && scResult.isRight()) {
      return const Right(null);
    }

    // Collect failures from both operations
    Failure? combinedFailure;
    
    vkResult.fold(
      (failure) => combinedFailure = failure,
      (_) {},
    );

    if (combinedFailure == null) {
      scResult.fold(
        (failure) => combinedFailure = failure,
        (_) {},
      );
    }

    return Left(combinedFailure!);
  }
}
