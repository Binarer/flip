
import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/auth/data/models/Auth/vk_token.dart';
import 'package:flip/features/auth/domain/repositories/vk_auth_repository.dart';

class VKLoginUseCase {
  final VKAuthRepository repository;

  VKLoginUseCase(this.repository);

  Future<Either<Failure, VKToken>> call(String code) async {
    if (code.isEmpty) {
      return Left(
        const ValidationFailure(message: 'Empty VK auth code'),
      );
    }
    return repository.login(code);
  }
}
