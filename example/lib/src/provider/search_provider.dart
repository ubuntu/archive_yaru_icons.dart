import 'package:flutter/material.dart';

import '../animated_icon_items.dart';
import '../common/icon_item.dart';
import '../icon_items.dart';

class SearchProvider extends ChangeNotifier {
  List<IconItem>? filteredIconItems;
  List<IconItem>? filteredAnimatedIconItems;

  final searchController = TextEditingController();
  final focusNode = FocusNode();

  bool _search = false;
  bool get search => _search;

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  void _escape() {
    filteredIconItems = null;
    filteredAnimatedIconItems = null;
    searchController.clear();
    focusNode.unfocus();
  }

  void toggleSearch() {
    _search = !_search;
    focusNode.requestFocus();

    if (!_search) {
      _escape();
    }

    notifyListeners();
  }

  void onEscape() {
    _escape();
    _search = !_search;

    notifyListeners();
  }

  void onSearchChanged(String value) {
    if (value == '') {
      filteredIconItems = null;
      filteredAnimatedIconItems = null;
      searchController.clear();

      notifyListeners();
      return;
    }

    filteredIconItems = [];
    filteredIconItems!.addAll(
      iconItems.where((iconItem) {
        return iconItem.name.toLowerCase().contains(value.toLowerCase());
      }),
    );

    filteredAnimatedIconItems = [];
    filteredAnimatedIconItems!.addAll(
      animatedIconItems.where((animatedIconItem) {
        return animatedIconItem.name
            .toLowerCase()
            .contains(value.toLowerCase());
      }),
    );

    notifyListeners();
  }
}
