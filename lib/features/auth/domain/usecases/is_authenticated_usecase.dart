import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/auth/domain/repositories/vk_auth_repository.dart';

class IsAuthenticatedUseCase {
  final VKAuthRepository repository;

  IsAuthenticatedUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return repository.isAuthenticated();
  }
}
