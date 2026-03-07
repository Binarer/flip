import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/features/auth/data/models/Auth/sc_token.dart';
import 'package:flip/features/auth/domain/repositories/sc_auth_repository.dart';

class SoundCloudLoginUseCase {
  final SoundCloudAuthRepository repository;

  SoundCloudLoginUseCase(this.repository);

  Future<Either<Failure, SoundCloudToken>> call(String code) async {
    if (code.isEmpty) {
      return Left(const ValidationFailure(message: 'Empty SoundCloud auth code'));
    }
    return repository.login(code);
  }
}
