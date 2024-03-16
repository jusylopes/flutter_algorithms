import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team 5',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.tealAccent.shade700),
        useMaterial3: true,
        fontFamily: 'Anta',
      ),
      home: const MyHomePage(title: 'Team 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _result = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _desafio2(int valueA, int valueB, int valueC) {
    int sum = valueA + valueB;
    setState(() {
      _result =
          'A soma de $valueA + $valueB é $sum, esse número ${sum > valueC ? 'é maior que' : 'não é maior que'} $valueC';
    });
  }

void _desafio3() {
    int result = 1;
    int fatorial = 5;

    for (int i = 1; i <= fatorial; i++) {
      result *= i;
    }

    setState(() {
      _result = 'O resultado fatorial de $fatorial! é $result.';
    });
  }

  void _desafio4(int number) {
    String evenOrOdd = number % 2 == 0 ? 'par' : 'ímpar';
    String positiveOrNegative = number > 0 ? 'positivo' : 'negativo';

    setState(() {
      _result = '$number é $evenOrOdd e $positiveOrNegative';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: Text(widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/bongo-cat-button.gif'),
            ),
            ButtonCalculate(
              callChallenge: () {
                // _desafio2(2, 5, 10);
                _desafio4(-7);
              },
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              const Text(
                'Resultado:',
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonCalculate extends StatelessWidget {
  final Function() callChallenge;
  const ButtonCalculate({
    super.key,
    required this.callChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: callChallenge,
          child: const Text(
            'calcular',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
