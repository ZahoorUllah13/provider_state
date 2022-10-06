import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class ThemeChangerScreeen extends StatefulWidget {
  const ThemeChangerScreeen({Key? key}) : super(key: key);

  @override
  _ThemeChangerScreeenState createState() => _ThemeChangerScreeenState();
}

class _ThemeChangerScreeenState extends State<ThemeChangerScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('theme'),
      ),
      body: Column(
        children: [
          Consumer<ThemeChanger>(builder: (context, value, child) {
            return RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: value.mode,
              onChanged: value.setTheme,
            );
          }),
          Consumer<ThemeChanger>(builder: (context, value, child) {
            return RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: value.mode,
              onChanged: value.setTheme,
            );
          }),
        ],
      ),
    );
  }
}
