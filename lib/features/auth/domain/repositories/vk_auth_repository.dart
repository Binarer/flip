import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/features/auth/data/models/Auth/vk_token.dart';
import 'package:flip/features/auth/data/models/User/vk_user.dart';

abstract class VKAuthRepository {
  /// Запуск VK OAuth по коду авторизации (полученному из WebView).
  Future<Either<Failure, VKToken>> login(String authCode);

  /// Получить текущего пользователя VK (по сохранённому токену).
  Future<Either<Failure, VKUser>> getCurrentUser();

  /// Проверка, авторизован ли пользователь (валидный токен есть в хранилище).
  Future<Either<Failure, bool>> isAuthenticated();

  /// Очистка токенов и локальных данных авторизации.
  Future<Either<Failure, void>> logout();
}
