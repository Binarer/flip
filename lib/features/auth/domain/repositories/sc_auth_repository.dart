import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/auth/domain/entities/index.dart';

abstract class SoundCloudAuthRepository {
  /// SoundCloud OAuth login.
  Future<Either<Failure, SoundCloudToken>> login(String code);

  /// Get current user profile.
  Future<Either<Failure, SoundCloudUser>> getCurrentUser();

  /// Logout and clear storage.
  Future<Either<Failure, void>> logout();

  /// Check authentication status.
  Future<Either<Failure, bool>> isAuthenticated();
}
