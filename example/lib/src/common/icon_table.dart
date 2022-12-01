import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/icon_size_provider.dart';
import '../utils.dart';
import 'clickable_icon.dart';
import 'icon_item.dart';
import 'icon_usage.dart';

@immutable
class IconTable extends StatelessWidget {
  const IconTable({
    super.key,
    required this.iconItems,
  });

  final List<IconItem> iconItems;

  @override
  Widget build(BuildContext context) {
    final iconViewProvider = Provider.of<IconViewProvider>(context);

    return ListView.builder(
      itemCount: iconItems.length,
      itemBuilder: (context, index) => Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          SizedBox.square(
            dimension: iconViewProvider.iconSize * 1.5,
            child: ClickableIcon(iconItem: iconItems[index]),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: SelectableText(
              beautifyIconName(iconItems[index].name),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: IconUsage(
              usage: iconItems[index].usage,
              label: false,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints.expand(
          width: constraints.maxWidth,
        ),
        child: SingleChildScrollView(
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
            dataRowHeight: iconViewProvider.iconSize + 16,
            rows: [
              for (var i = 0; i < iconItems.length; i += 1)
                DataRow(
                  cells: [
                    DataCell(
                      ClickableIcon(iconItem: iconItems[i]),
                    ),
                    DataCell(
                      SelectableText(
                        beautifyIconName(iconItems[i].name),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    DataCell(
                      IconUsage(
                        usage: iconItems[i].usage,
                        label: false,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
