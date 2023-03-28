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
    usage: 'YaruAnimatedOkIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      mode: YaruAnimationMode.once,
      size: iconSize,
      data: const YaruAnimatedOkIcon(),
    ),
  ),
  IconItem(
    name: 'Ok filled',
    usage: 'YaruAnimatedOkIcon(filled: true)',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      mode: YaruAnimationMode.once,
      size: iconSize,
      data: const YaruAnimatedOkIcon(filled: true),
    ),
  ),
  IconItem(
    name: 'No network',
    usage: 'YaruAnimatedNoNetworkIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      size: iconSize,
      data: const YaruAnimatedNoNetworkIcon(),
    ),
  ),
  IconItem(
    name: 'Compass',
    usage: 'YaruAnimatedCompassIcon()',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      mode: YaruAnimationMode.once,
      size: iconSize,
      data: const YaruAnimatedCompassIcon(),
    ),
  ),
  IconItem(
    name: 'Compass filled',
    usage: 'YaruAnimatedCompassIcon(filled: true)',
    iconBuilder: (context, iconSize) => YaruAnimatedIcon(
      mode: YaruAnimationMode.once,
      size: iconSize,
      data: const YaruAnimatedCompassIcon(filled: true),
    ),
  ),
];

final List<IconItem> widgetIconItems = [
  IconItem(
    name: 'Placeholder',
    usage: 'YaruPlaceholderIcon()',
    iconBuilder: (context, iconSize) => YaruPlaceholderIcon(
      size: Size.square(iconSize),
    ),
  ),
];
