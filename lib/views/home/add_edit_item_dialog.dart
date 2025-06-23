import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/item_model.dart' show Item;
import '../../view_models/item_view_model.dart' show itemViewModelProvider;

class AddEditItemDialog extends ConsumerStatefulWidget {
  final Item? item;
  const AddEditItemDialog({this.item, super.key});

  @override
  ConsumerState<AddEditItemDialog> createState() => _AddEditItemDialogState();
}

class _AddEditItemDialogState extends ConsumerState<AddEditItemDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.item?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.item?.description ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter title' : null,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter description' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (widget.item == null) {
                ref.read(itemViewModelProvider.notifier).addItem(
                  _titleController.text,
                  _descriptionController.text,
                );
              } else {
                ref.read(itemViewModelProvider.notifier).updateItem(
                  widget.item!.id,
                  _titleController.text,
                  _descriptionController.text,
                );
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}