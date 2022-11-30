import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'icon_size_provider.dart';

@immutable
class YaruIconGrid extends StatelessWidget {
  YaruIconGrid({super.key});
  final _iconNames = YaruIcons.all.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Consumer<IconSizeProvider>(
      builder: (context, iconSizeProvider, _) => GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: iconSizeProvider.size * 1.5,
        ),
        itemCount: _iconNames.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) => _IconDialog(
              iconName: _iconNames[index],
            ),
          ),
          child: Tooltip(
            verticalOffset: iconSizeProvider.size / 2,
            waitDuration: const Duration(milliseconds: 250),
            message: beautifyIconName(_iconNames[index]),
            child: Center(
              child: RepaintBoundary(
                child: Icon(
                  YaruIcons.all[_iconNames[index]]!,
                  size: iconSizeProvider.size,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const _iconDialogSizes = [
  16.0,
  24.0,
  32.0,
  48.0,
  64.0,
  128.0,
];
const _dialogContentPaddingValue = 16.0;

class _IconDialog extends StatelessWidget {
  const _IconDialog({
    required this.iconName,
  });

  final String iconName;

  @override
  Widget build(BuildContext context) {
    final usageTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontFamily: 'Monospace',
        );

    return SimpleDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.symmetric(vertical: _dialogContentPaddingValue),
      title: YaruTitleBar(
        title: Text(beautifyIconName(iconName)),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final size in _iconDialogSizes)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: (_iconDialogSizes.last - size) / 10 +
                      _dialogContentPaddingValue / 2,
                ),
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size / 10),
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.05),
                      ),
                      child: RepaintBoundary(
                        child: Icon(
                          YaruIcons.all[iconName]!,
                          size: size,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${size.toInt().toString()}px',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
          ],
        ),
        const Divider(
          indent: _dialogContentPaddingValue,
          endIndent: _dialogContentPaddingValue,
          height: _dialogContentPaddingValue * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Usage: ',
              style: usageTextStyle,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).highlightColor,
              ),
              child: SelectableText(
                'YaruIcons.$iconName',
                style: usageTextStyle,
              ),
            ),
          ],
        )
      ],
    );
  }
}

String beautifyIconName(String iconName) {
  iconName = iconName.replaceAll('_', ' ');

  return iconName.isNotEmpty
      ? '${iconName[0].toUpperCase()}${iconName.substring(1).toLowerCase()}'
      : '';
}
