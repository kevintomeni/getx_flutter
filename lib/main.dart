import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        texte: 'Bonjour le monde',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.texte});
  final String title;
  final String texte;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int _price = 25;
  int _total = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < 10) {
        _counter++;
      }
      _total = _price * _counter;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_counter > 1) {
        _counter--;
        _total = _price * _counter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.texte),
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Column(
              children: [
                Text("Vetements"),
                Text("Descriptions"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    _incrementCounter();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: _counter == 10 ? Colors.grey : Colors.blue,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("${_price}\$"),
                InkWell(
                  onTap: () {
                    _decrementCount();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: _counter == 1 ? Colors.grey : Colors.blue,
                    ),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Quantite ${_counter}"),
                Text("Price ${_total}\$"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
