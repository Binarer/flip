import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
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
    final vkResult = await vkRepository.logout();
    final scResult = await scRepository.logout();

    if (vkResult.isLeft()) return vkResult;
    return scResult;
  }
}
