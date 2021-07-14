import 'package:yaru_icons/widgets/yaru_icons.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart' as yaru;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Yaru Icons Demo',
      theme: yaru.lightTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const _from = 0xf101;
  static const _to = 0xf26c;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(YaruIcons.ubuntu_logo, color: yaru.Colors.orange),
        title: Text('Flutter Yaru Icons Demo'),
      ),
      body: GridView.extent(
        padding: const EdgeInsets.all(24),
        maxCrossAxisExtent: 72,
        children: List.generate(_to - _from + 1, (index) {
          final code = index + _from;
          return Column(
            children: [
              Icon(YaruIconsData(code)),
              const SizedBox(height: 8),
              Text(
                'ex' + code.toRadixString(16),
                style: TextStyle(
                  color: Colors.grey[600]
                )
              ),
            ],
          );
        }),
      ),
    );
  }
}
