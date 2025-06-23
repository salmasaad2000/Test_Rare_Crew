import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart' show AuthService;
import 'auth_view_model.dart' show authServiceProvider;

final profileViewModelProvider = Provider((ref) {
  final authService = ref.watch(authServiceProvider);
  return ProfileViewModel(authService);
});

class ProfileViewModel {
  final AuthService _authService;

  ProfileViewModel(this._authService);

  Future<void> signOut() async {
    await _authService.signOut();
  }
}