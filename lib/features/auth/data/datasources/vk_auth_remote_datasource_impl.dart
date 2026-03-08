import 'package:vk_id_auth2/vk_id_auth2.dart';
import 'package:flip/features/auth/data/datasources/vk_auth_remote_datasource.dart';
import 'package:flip/features/auth/data/models/Auth/vk_token.dart';
import 'package:flip/features/auth/data/models/User/vk_user.dart';

class VKAuthRemoteDataSourceImpl implements VKAuthRemoteDataSource {
  final _vkIdAuth = VkIdAuth();

  @override
  Future<VKToken> login() async {
    // We request empty scopes by default, or you can add ['groups', 'stats'] etc.
    final result = await _vkIdAuth.login([]);
    
    if (result == null) {
      throw Exception('VK Auth cancelled or failed');
    }

    // Map vk_id_auth2 result to our VKToken model
    return VKToken(
      accessToken: result.token,
      userId: result.userData.userId,
      expiresIn: 3600, // Default or parsed if available
      scopes: [],
    );
  }

  @override
  Future<VKUser> getCurrentUser(String accessToken) async {
    // Note: vk_id_auth2 gives us some user data immediately upon login.
    // To get full profile data for VK API music requests, we would use the token later.
    final result = await _vkIdAuth.login([]); // This is usually cached or we use the last result
    if (result == null) throw Exception('No user data');

    return VKUser(
      id: result.userData.userId,
      firstName: result.userData.firstName,
      lastName: result.userData.lastName,
      accessToken: result.token,
      photoUrl: result.userData.photoUrl,
    );
  }

  @override
  Future<void> logout() async {
    await _vkIdAuth.logout();
  }

  Future<void> initialize() async {
    final isInit = await _vkIdAuth.isInitialized;
    if (!isInit) {
      await _vkIdAuth.initialize();
    }
  }
}
