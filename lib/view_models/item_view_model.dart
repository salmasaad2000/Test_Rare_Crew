import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/item_model.dart' show Item;

final itemViewModelProvider =
StateNotifierProvider<ItemViewModel, List<Item>>((ref) => ItemViewModel());

class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

  void addItem(String title, String description) {
    state = [
      ...state,
      Item(
        id: const Uuid().v4(),
        title: title,
        description: description,
      )
    ];
  }

  void updateItem(String id, String newTitle, String newDescription) {
    state = state.map((item) {
      if (item.id == id) {
        return Item(
          id: item.id,
          title: newTitle,
          description: newDescription,
        );
      }
      return item;
    }).toList();
  }

  void deleteItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}