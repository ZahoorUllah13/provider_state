import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/example_one_provider.dart';
import 'package:provider_state/provider/favourite_provider.dart';
import 'package:provider_state/provider/theme_changer_provider.dart';
import 'package:provider_state/screen/example_one.dart';
import 'package:provider_state/screen/theme_changer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ShowProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child:Builder(builder:(BuildContext context){
       final themeData=Provider.of<ThemeChanger>(context);
        return MaterialApp(
        themeMode: themeData.mode,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const ExampleOne(),
    );
    }),
    );
  }
}
