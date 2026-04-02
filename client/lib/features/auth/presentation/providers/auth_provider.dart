import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_nexus/core/network/api_client.dart';
import 'package:shop_nexus/features/auth/data/models/login_request.dart';
import 'package:shop_nexus/features/auth/data/models/login_response.dart';
import 'package:shop_nexus/features/auth/data/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRepository(apiClient);
});

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

class AuthNotifier extends AsyncNotifier<LoginResponse?> {
  late final AuthRepository _authRepository;

  @override
  Future<LoginResponse?> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _authRepository.login(request);
      state = AsyncValue.data(response);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, LoginResponse?>(
  AuthNotifier.new,
);
