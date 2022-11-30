import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'icon_size_provider.dart';

@immutable
class YaruIconTable extends StatelessWidget {
  YaruIconTable({super.key});

  final _iconNames = YaruIcons.all.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Consumer<IconSizeProvider>(
      builder: (context, iconSizeProvider, _) => SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text('Icon preview'),
            ),
            DataColumn(
              label: Text('Icon name'),
            ),
            DataColumn(
              label: Text('Usage'),
            ),
          ],
          dataRowHeight: iconSizeProvider.size + 16,
          rows: [
            for (var i = 0; i < _iconNames.length; i += 1)
              DataRow(
                cells: [
                  DataCell(
                    Icon(
                      YaruIcons.all[_iconNames[i]]!,
                      size: iconSizeProvider.size,
                    ),
                  ),
                  DataCell(
                    SelectableText(
                      _iconNames[i],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  DataCell(
                    SelectableText(
                      'YaruIcons.${_iconNames[i]}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontFamily: 'Monospace',
                            backgroundColor: Theme.of(context).highlightColor,
                          ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
