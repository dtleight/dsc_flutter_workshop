import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
