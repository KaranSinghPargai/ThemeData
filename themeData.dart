import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:privatechat/utils/theme_constants.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.indigo,
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: Color(0xfff1f1f1),
);

ThemeData dark = ThemeData(
  scaffoldBackgroundColor: Color(0xff201F24),
  backgroundColor: Color(0xff201F24),
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";

  bool darkTheme = false;

  //Getter

  themeNotifier() {
    darkTheme = true;
  }

  toggleTheme() {
    darkTheme = !darkTheme;

    notifyListeners();
  }
}


// SwitchBox for dark mode. 

Consumer(
      builder: (context, ThemeNotifier themeNotifier, child) =>
      SwitchListTile(
      title: Text("Dark Mode"),
      onChanged: (val) {
                  themeNotifier.toggleTheme();
                },
      value: themeNotifier.darkTheme,
       ),
       ),

// Main.dart 
ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      builder: (context, Widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Private.Chat',
          theme: Provider.of<ThemeNotifier>(context).darkTheme ? dark : light,
          home: HomePage(),
        );
      },
    );
