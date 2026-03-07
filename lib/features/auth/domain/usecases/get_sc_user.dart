import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/features/auth/data/models/User/sc_user.dart';
import 'package:flip/features/auth/domain/repositories/sc_auth_repository.dart';

class GetSoundCloudUserUseCase {
  final SoundCloudAuthRepository repository;

  GetSoundCloudUserUseCase(this.repository);

  Future<Either<Failure, SoundCloudUser>> call() async {
    return repository.getCurrentUser();
  }
}
