import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';

import '../provider/search_provider.dart';

class SearchEntry extends StatelessWidget implements PreferredSizeWidget {
  const SearchEntry({super.key, required this.appBarHeight});

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.logicalKey == LogicalKeyboardKey.escape) {
          searchProvider.onEscape();
          return;
        }
      },
      child: TextField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          prefixIcon: const Icon(
            YaruIcons.search,
            size: 24,
          ),
          prefixIconConstraints: BoxConstraints.expand(
            width: 40,
            height: appBarHeight,
          ),
          hintText: 'Search icons...',
        ),
        textAlignVertical: TextAlignVertical.center,
        autofocus: true,
        controller: searchProvider.searchController,
        focusNode: searchProvider.focusNode,
        onChanged: searchProvider.onSearchChanged,
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, appBarHeight);
}
