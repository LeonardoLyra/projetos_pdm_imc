import 'package:flutter/material.dart';
import 'package:imc_app/ui/imc.page.dart';

void main() => runApp(MyApp());
//runApp(Platform.isAndroid ? MyApp() : MyAppIOS());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: IMCPage(),
    );
  } //widget build
}
