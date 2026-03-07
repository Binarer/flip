import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flip/features/auth/data/datasources/vk_auth_remote_datasource.dart';
import 'package:flip/features/auth/data/models/Auth/vk_token.dart';
import 'package:flip/features/auth/data/models/User/vk_user.dart';
import 'package:flip/features/auth/domain/repositories/vk_auth_repository.dart';

class VKAuthRepositoryImpl implements VKAuthRepository {
  final VKAuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  VKAuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, VKToken>> login(String? authCode) async {
    try {
      // In a real app, if authCode is provided, we exchange it for a token.
      // If it's not provided, we trigger the login process via WebView.
      final token = await remoteDataSource.login();
      await localDataSource.cacheVKToken(token);
      return Right(token);
    } catch (e) {
      return Left(AuthFailure(message: 'Failed to login with VK: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, VKUser>> getCurrentUser() async {
    try {
      final token = await localDataSource.getVKToken();
      if (token == null || token.isExpired) {
        return Left(const AuthFailure(message: 'User is not authenticated or token expired'));
      }
      final user = await remoteDataSource.getCurrentUser(token.accessToken);
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(message: 'Failed to get current user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      final token = await localDataSource.getVKToken();
      return Right(token != null && !token.isExpired);
    } catch (e) {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.clearVKToken();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(message: 'Failed to logout: ${e.toString()}'));
    }
  }
}
