import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_models/item_view_model.dart' show itemViewModelProvider;
import 'add_edit_item_dialog.dart' show AddEditItemDialog;

class ItemList extends ConsumerWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemViewModelProvider);

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AddEditItemDialog(item: item),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => ref
                    .read(itemViewModelProvider.notifier)
                    .deleteItem(item.id),
              ),
            ],
          ),
        );
      },
    );
  }
}