import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip/features/auth/domain/usecases/get_vk_user.dart';
import 'package:flip/features/auth/domain/usecases/is_authenticated_usecase.dart';
import 'package:flip/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flip/features/auth/domain/usecases/vk_login_usecase.dart';
import 'package:flip/features/auth/presentation/blocs/auth_event.dart';
import 'package:flip/features/auth/presentation/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsAuthenticatedUseCase isAuthenticatedUseCase;
  final GetVKUserUseCase getVKUserUseCase;
  final VKLoginUseCase vkLoginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.isAuthenticatedUseCase,
    required this.getVKUserUseCase,
    required this.vkLoginUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<VKLoginPressed>(_onVKLoginPressed);
    on<LogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await isAuthenticatedUseCase();
    
    await result.fold(
      (failure) async => emit(Unauthenticated()),
      (authenticated) async {
        if (authenticated) {
          final userResult = await getVKUserUseCase();
          userResult.fold(
            (failure) => emit(Unauthenticated()),
            (user) => emit(Authenticated(user)),
          );
        } else {
          emit(Unauthenticated());
        }
      },
    );
  }

  Future<void> _onVKLoginPressed(VKLoginPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    // Passing empty string for now, the repository will handle WebView triggering
    final result = await vkLoginUseCase('');
    
    await result.fold(
      (failure) async => emit(AuthError(failure.message)),
      (token) async {
        final userResult = await getVKUserUseCase();
        userResult.fold(
          (failure) => emit(AuthError(failure.message)),
          (user) => emit(Authenticated(user)),
        );
      },
    );
  }

  Future<void> _onLogoutPressed(LogoutPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(Unauthenticated()),
    );
  }
}
