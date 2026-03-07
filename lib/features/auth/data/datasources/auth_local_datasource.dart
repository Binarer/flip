import 'package:flip/features/auth/data/models/Auth/vk_token.dart';

abstract class AuthLocalDataSource {
  /// Cache VK token locally.
  Future<void> cacheVKToken(VKToken token);

  /// Get cached VK token.
  Future<VKToken?> getVKToken();

  /// Delete cached VK token.
  Future<void> clearVKToken();
}
