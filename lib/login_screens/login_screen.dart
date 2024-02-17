import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Container(),
            Container(),
          ]),
        ),
      ),
    );
  }
}
