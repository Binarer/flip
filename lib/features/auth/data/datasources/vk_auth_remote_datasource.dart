import 'package:flip/features/auth/data/models/Auth/vk_token.dart';
import 'package:flip/features/auth/data/models/User/vk_user.dart';

abstract class VKAuthRemoteDataSource {
  /// Start VK ID login process (e.g., via WebView or SDK).
  Future<VKToken> login();

  /// Get current user profile from VK API.
  Future<VKUser> getCurrentUser(String accessToken);

  /// Logout from VK.
  Future<void> logout();
}
