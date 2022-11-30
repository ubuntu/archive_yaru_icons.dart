import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_colors/yaru_colors.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'src/animated_icons_grid.dart';
import 'src/icon_grid.dart';
import 'src/icon_size_provider.dart';

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
        home: ChangeNotifierProvider(
          create: (context) => IconSizeProvider(),
          builder: (context, child) {
            final iconSizeProvider = Provider.of<IconSizeProvider>(context);

            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  leading: const Icon(
                    YaruIcons.ubuntu_logo,
                    color: YaruColors.orange,
                  ),
                  title: Consumer<IconSizeProvider>(
                    builder: (context, iconsSize, _) => Text(
                      'Flutter Yaru Icons Demo (${iconsSize.size.truncate()}px)',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: iconSizeProvider.isMinSize()
                          ? null
                          : iconSizeProvider.decreaseSize,
                      child: const Icon(YaruIcons.minus),
                    ),
                    TextButton(
                      onPressed: iconSizeProvider.increaseSize,
                      child: const Icon(YaruIcons.plus),
                    )
                  ],
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: 'Static Icons'),
                      Tab(text: 'Animated Icons'),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    YaruIconGrid(),
                    const YaruAnimatedIconsGrid(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
