import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  String _currentFortune = "";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = "";

  final _fortuneList = [
    "You will be lucky today",
    "You will be unlucky today",
    "You will be very lucky today",
    "You will be very unlucky today",
    "You will be very very lucky today",
    "You will be very very unlucky today",
    "You will be very very very lucky today",
    "You will be very very very unlucky today",
    "You will be very very very very lucky today",
    "You will be very very very very unlucky today",
  ];

  void _randomFortune() {
    var random = Random();
    int fortune = random.nextInt(_fortuneList.length);
    setState(() {
      _currentFortune = _fortuneList[fortune];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fortune Cookie"),
        titleTextStyle: Theme.of(context).textTheme.headlineLarge,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/fortune_cookie.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Text(
                  "${_currentFortune}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _randomFortune,
                child: Text("Get Fortune",
                    style: Theme.of(context).textTheme.titleMedium)),
          ],
        ),
      ),
/*       floatingActionButton: FloatingActionButton(
        onPressed: _randomFortune,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),  */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
