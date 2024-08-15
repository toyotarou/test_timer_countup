import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Timer? timer;

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => startTimer(),
                  child: const Text('start'),
                ),
                ElevatedButton(
                  onPressed: () => stopTimer(),
                  child: const Text('stop'),
                ),
                ElevatedButton(
                  onPressed: () => resetTimer(),
                  child: const Text('reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() => _counter++),
    );
  }

  ///
  void resetTimer() => setState(() => _counter = 0);

  ///
  void stopTimer({bool reset = true}) => setState(() => timer?.cancel());
}
