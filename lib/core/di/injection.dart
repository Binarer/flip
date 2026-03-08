import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flip/features/auth/data/datasources/vk_auth_remote_datasource.dart';
import 'package:flip/features/auth/data/models/Auth/vk_token.dart';
import 'package:flip/features/auth/data/models/User/vk_user.dart';
import 'package:flip/features/auth/data/repositories/vk_auth_repository_impl.dart';
import 'package:flip/features/auth/domain/repositories/sc_auth_repository.dart';
import 'package:flip/features/auth/domain/entities/index.dart';
import 'package:flip/features/auth/domain/usecases/get_vk_user.dart';
import 'package:flip/features/auth/domain/usecases/is_authenticated_usecase.dart';
import 'package:flip/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flip/features/auth/domain/usecases/vk_login_usecase.dart';
import 'package:flip/features/auth/presentation/blocs/auth_bloc.dart';

import 'package:flip/features/auth/data/datasources/vk_auth_remote_datasource_impl.dart';

class DI {
  static final DI _instance = DI._internal();
  factory DI() => _instance;
  DI._internal();

  late final AuthBloc authBloc;

  Future<void> init() async {
    // Data Sources
    final remoteDataSource = VKAuthRemoteDataSourceImpl();
    final localDataSource = MockAuthLocalDataSource();

    // Initialize VK ID SDK
    await remoteDataSource.initialize();

    // Repositories
    final vkAuthRepository = VKAuthRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );
    ...

    final scAuthRepository = MockSoundCloudAuthRepository();

    // Use Cases
    final isAuthenticatedUseCase = IsAuthenticatedUseCase(vkAuthRepository);
    final getVKUserUseCase = GetVKUserUseCase(vkAuthRepository);
    final vkLoginUseCase = VKLoginUseCase(vkAuthRepository);
    final logoutUseCase = LogoutUseCase(
      vkRepository: vkAuthRepository,
      scRepository: scAuthRepository,
    );

    // Blocs
    authBloc = AuthBloc(
      isAuthenticatedUseCase: isAuthenticatedUseCase,
      getVKUserUseCase: getVKUserUseCase,
      vkLoginUseCase: vkLoginUseCase,
      logoutUseCase: logoutUseCase,
    );
  }
}

class MockVKAuthRemoteDataSource implements VKAuthRemoteDataSource {
  @override
  Future<VKUser> getCurrentUser(String accessToken) async {
    return const VKUser(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      accessToken: 'mock_token',
      photoUrl: 'https://via.placeholder.com/150',
    );
  }

  @override
  Future<VKToken> login() async {
    await Future.delayed(const Duration(seconds: 2));
    return VKToken(
      accessToken: 'mock_token',
      userId: 1,
      expiresIn: 3600,
      scopes: ['audio'],
    );
  }

  @override
  Future<void> logout() async {}
}

class MockAuthLocalDataSource implements AuthLocalDataSource {
  VKToken? _token;

  @override
  Future<void> cacheVKToken(VKToken token) async {
    _token = token;
  }

  @override
  Future<void> clearVKToken() async {
    _token = null;
  }

  @override
  Future<VKToken?> getVKToken() async {
    return _token;
  }
}

class MockSoundCloudAuthRepository implements SoundCloudAuthRepository {
  @override
  Future<Either<Failure, SoundCloudUser>> getCurrentUser() async => 
    Left(AuthFailure(message: 'Not implemented'));
    
  @override
  Future<Either<Failure, bool>> isAuthenticated() async => const Right(false);
  
  @override
  Future<Either<Failure, SoundCloudToken>> login(String code) async => 
    Left(AuthFailure(message: 'Not implemented'));
    
  @override
  Future<Either<Failure, void>> logout() async => const Right(null);
}
