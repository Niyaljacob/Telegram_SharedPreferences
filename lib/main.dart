import 'package:flutter/material.dart';
import 'package:telegram/screen/splashscreen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
