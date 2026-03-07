import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/auth/data/models/User/vk_user.dart';
import 'package:flip/features/auth/domain/repositories/vk_auth_repository.dart';

class GetVKUserUseCase {
  final VKAuthRepository repository;

  GetVKUserUseCase(this.repository);

  Future<Either<Failure, VKUser>> call() async {
    return repository.getCurrentUser();
  }
}
