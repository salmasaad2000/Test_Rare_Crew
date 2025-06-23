import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart' show UserModel;
import '../services/auth_service.dart' show AuthService;

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authStateProvider = StreamProvider<UserModel?>((ref) {
  return ref.watch(authServiceProvider).user;
});