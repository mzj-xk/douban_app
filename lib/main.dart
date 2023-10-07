import 'package:flutter/material.dart';
import 'package:douban/view/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.green,
          appBarTheme: AppBarTheme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.green))),
      routes: {
        '/': (context) => const NavigationBar(),
      },
    );
  }
}
