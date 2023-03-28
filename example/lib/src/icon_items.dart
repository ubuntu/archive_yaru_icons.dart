import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'common/icon_item.dart';

final _iconNames = YaruIcons.all.keys.toList();

final List<IconItem> iconItems = [
  for (final iconName in _iconNames)
    IconItem(
      name: iconName,
      usage: 'YaruIcons.$iconName',
      iconBuilder: (context, iconSize) => Icon(
        YaruIcons.all[iconName]!,
        size: iconSize,
      ),
    )
];

final List<IconItem> animatedIconItems = [
  IconItem(
    name: 'Ok',
    usage: _wrapWithAnimatedIconUsage('YaruAnimatedOkIcon()'),
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedOkIcon(),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Ok filled',
    usage: _wrapWithAnimatedIconUsage('YaruAnimatedOkIcon(filled: true)'),
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedOkIcon(filled: true),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'No network',
    usage: _wrapWithAnimatedIconUsage('YaruAnimatedNoNetworkIcon()'),
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedNoNetworkIcon(),
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Compass',
    usage: _wrapWithAnimatedIconUsage('YaruAnimatedCompassIcon()'),
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedCompassIcon(),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
  IconItem(
    name: 'Compass filled',
    usage: _wrapWithAnimatedIconUsage('YaruAnimatedCompassIcon(filled: true)'),
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      const YaruAnimatedCompassIcon(filled: true),
      mode: YaruAnimationMode.once,
      size: iconSize,
    ),
  ),
];

String _wrapWithAnimatedIconUsage(String source) {
  return 'YaruAnimatedIcon(const $source)';
}

final List<IconItem> widgetIconItems = [
  IconItem(
    name: 'Placeholder',
    usage: 'YaruPlaceholderIcon()',
    iconBuilder: (context, iconSize) => YaruPlaceholderIcon(
      size: Size.square(iconSize),
    ),
  ),
];
