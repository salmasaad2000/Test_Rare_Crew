import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_rarecrew/view_models/auth_view_model.dart' show authStateProvider;
import 'package:test_rarecrew/views/auth/login_screen.dart' show LoginScreen;
import 'package:test_rarecrew/views/main_screen.dart' show MainScreen;
import 'firebase_options.dart' show DefaultFirebaseOptions;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'MVVM Riverpod Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: authState.when(
        data: (user) => user == null ? const LoginScreen() : const MainScreen(),
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (err, _) => Scaffold(body: Center(child: Text('Error: $err'))),
      ),
    );
  }
}