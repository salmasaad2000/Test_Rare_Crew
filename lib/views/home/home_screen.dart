import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_edit_item_dialog.dart' show AddEditItemDialog;
import 'item_list.dart' show ItemList;
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const ItemList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const AddEditItemDialog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}