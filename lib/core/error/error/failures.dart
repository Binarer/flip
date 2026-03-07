// lib/core/error/failures.dart

/// Базовый тип ошибки домена.
/// В domain/usecases и repositories используешь Either<Failure, T>.
abstract class Failure {
  /// Технич. сообщение (для логов/дебага).
  final String message;

  /// Код ошибки (чтобы маппить на UI / аналитику).
  final String? code;

  /// Доп. данные (raw error, stacktrace и т.п.).
  final dynamic details;

  const Failure({
    required this.message,
    this.code,
    this.details,
  });

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}

/// Ошибки сети: таймаут, нет интернета, 5xx и т.п.
class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Ошибки, возвращаемые API (VK, SoundCloud), например неверный токен.
class ApiFailure extends Failure {
  final int? statusCode;

  const ApiFailure({
    required super.message,
    super.code,
    super.details,
    this.statusCode,
  });

  @override
  String toString() =>
      'ApiFailure(statusCode: $statusCode, code: $code, message: $message)';
}

/// Ошибка авторизации VK (нет токена, истек, отказ в доступе).
class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Ошибка кеша/локального хранилища.
class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Ошибка валидации/доменных инвариантов (невалидный плейлист, трек и т.п.).
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Необработанная/неизвестная ошибка.
class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.code,
    super.details,
  });
}
