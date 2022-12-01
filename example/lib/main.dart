import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_colors/yaru_colors.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'src/animated_icon_items.dart';
import 'src/common/icon_grid.dart';
import 'src/common/icon_table.dart';
import 'src/common/search_entry.dart';
import 'src/icon_items.dart';
import 'src/provider/icon_size_provider.dart';
import 'src/provider/search_provider.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) => MaterialApp(
        title: 'Flutter Yaru Icons Demo',
        debugShowCheckedModeBanner: false,
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => IconViewProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => SearchProvider(),
            ),
          ],
          builder: (context, child) {
            final iconViewProvider = Provider.of<IconViewProvider>(context);
            final searchProvider = Provider.of<SearchProvider>(context);

            return Scaffold(
              appBar: AppBar(
                leading: const Icon(
                  YaruIcons.ubuntu_logo,
                  color: YaruColors.orange,
                ),
                title: Text(
                  'Flutter Yaru Icons Demo (${iconViewProvider.iconSize.truncate()}px)',
                ),
                actions: [
                  TextButton(
                    onPressed: iconViewProvider.toggleGridView,
                    child: iconViewProvider.gridView
                        ? const Icon(YaruIcons.format_unordered_list)
                        : const Icon(YaruIcons.app_grid),
                  ),
                  TextButton(
                    onPressed: searchProvider.toggleSearch,
                    child: const Icon(YaruIcons.search),
                  ),
                  TextButton(
                    onPressed: iconViewProvider.isMinIconSize()
                        ? null
                        : iconViewProvider.decreaseIconSize,
                    child: const Icon(YaruIcons.minus),
                  ),
                  TextButton(
                    onPressed: iconViewProvider.increaseIconSize,
                    child: const Icon(YaruIcons.plus),
                  )
                ],
                bottom: searchProvider.search
                    ? SearchEntry(
                        appBarHeight:
                            Theme.of(context).appBarTheme.toolbarHeight!,
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
                        style: style,
                      );
                    case 1:
                      return const YaruNavigationRailItem(
                        icon: Icon(YaruIcons.video),
                        label: Text('Animated icons'),
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
          },
        ),
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
