import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_models/auth_view_model.dart' show authStateProvider;
import '../../view_models/profile_view_model.dart' show profileViewModelProvider;

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final profileVM = ref.watch(profileViewModelProvider);

    return authState.when(
      data: (user) => Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: user == null
            ? const Center(child: Text('Not signed in'))
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User ID: ${user.uid}', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 8),
              Text('Email: ${user.email}', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () => profileVM.signOut(),
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
    );
  }
}