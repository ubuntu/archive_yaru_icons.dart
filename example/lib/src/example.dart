import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru_colors/yaru_colors.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'common/icon_grid.dart';
import 'common/icon_table.dart';
import 'common/search_entry.dart';
import 'icon_items.dart';
import 'provider/icon_size_provider.dart';
import 'provider/search_provider.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final iconViewProvider = Provider.of<IconViewProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.usb,
          color: YaruColors.orange,
        ),
        title: Text(
          'Flutter Yaru Icons Demo (${iconViewProvider.iconSize.truncate()}px)',
        ),
        actions: [
          Tooltip(
            message: iconViewProvider.gridView
                ? 'Toggle list view'
                : 'Toggle grid view',
            child: TextButton(
              onPressed: iconViewProvider.toggleGridView,
              child: iconViewProvider.gridView
                  ? const Icon(YaruIcons.format_unordered_list)
                  : const Icon(YaruIcons.app_grid),
            ),
          ),
          Tooltip(
            message: searchProvider.search
                ? 'Hide search entry'
                : 'Show search entry',
            child: TextButton(
              onPressed: searchProvider.toggleSearch,
              child: const Icon(YaruIcons.search),
            ),
          ),
          Tooltip(
            message: 'Decrease icon size',
            child: TextButton(
              onPressed: iconViewProvider.minIconSize
                  ? null
                  : iconViewProvider.decreaseIconSize,
              child: const Icon(YaruIcons.minus),
            ),
          ),
          Tooltip(
            message: 'Increase icon size',
            child: TextButton(
              onPressed: iconViewProvider.maxIconSize
                  ? null
                  : iconViewProvider.increaseIconSize,
              child: const Icon(YaruIcons.plus),
            ),
          )
        ],
        bottom: searchProvider.search
            ? SearchEntry(
                appBarHeight: Theme.of(context).appBarTheme.toolbarHeight!,
                onEscape: searchProvider.onEscape,
                controller: searchProvider.textEntryController,
                focusNode: searchProvider.textEntryFocusNode,
                onChanged: searchProvider.onSearchChanged,
              )
            : null,
      ),
      body: YaruCompactLayout(
        length: 2,
        itemBuilder: (context, index, selected) {
          const style = YaruNavigationRailStyle.labelled;

          switch (index) {
            case 0:
              return const YaruNavigationRailItem(
                icon: Icon(YaruIcons.image),
                label: Text('Static icons'),
                tooltip: 'Static icons',
                style: style,
              );
            case 1:
              return const YaruNavigationRailItem(
                icon: Icon(YaruIcons.video),
                label: Text('Animated icons'),
                tooltip: 'Animated icons',
                style: style,
              );
            default:
              throw 'Invalid index';
          }
        },
        pageBuilder: (context, index) {
          switch (index) {
            case 0:
              return const _IconView();
            case 1:
              return const _AnimatedIconView();
            default:
              throw 'Invalid index';
          }
        },
      ),
    );
  }
}

class _IconView extends StatelessWidget {
  const _IconView();

  @override
  Widget build(BuildContext context) {
    final iconViewProvider = Provider.of<IconViewProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);

    final localIconItems = searchProvider.filteredIconItems != null
        ? searchProvider.filteredIconItems!
        : iconItems;

    return iconViewProvider.gridView
        ? IconGrid(iconItems: localIconItems)
        : IconTable(iconItems: localIconItems);
  }
}

class _AnimatedIconView extends StatelessWidget {
  const _AnimatedIconView();

  @override
  Widget build(BuildContext context) {
    final iconViewProvider = Provider.of<IconViewProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);

    final localAnimatedIconItems =
        searchProvider.filteredAnimatedIconItems != null
            ? searchProvider.filteredAnimatedIconItems!
            : animatedIconItems;

    return iconViewProvider.gridView
        ? IconGrid(iconItems: localAnimatedIconItems)
        : IconTable(iconItems: localAnimatedIconItems);
  }
}
