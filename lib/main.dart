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
  String? _nameChallenge;

  final List<DropdownMenuItem<String>> _challengesList =
      List.generate(18, (index) {
    final desafioNumber = index + 1;
    return DropdownMenuItem<String>(
      value: 'desafio$desafioNumber',
      child: Text('Desafio $desafioNumber'),
    );
  });

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void callChallenge() {
    Map<String, Function> challengeFunctions = {
      'desafio1': () => _desafio1(2, 4),
      'desafio2': () => _desafio2(2, 5, 10),
      'desafio3': () => _desafio3(5),
      'desafio4': () => _desafio4(-7),
      'desafio5': () => _desafio5(10, 5),
      'desafio6': () => _desafio6(27),
      'desafio7': () => _desafio7(1871, 1417),
      'desafio8': () => _desafio8(57, 7, 99),
      'desafio9': () => _desafio9([5, 7, 6]),
      'desafio10': () => _desafio10('Vinicius', 31),
      'desafio11': () => _desafio11(5),
      'desafio12': () => _desafio12([2, 4, 6]),
      'desafio13': () => _desafio13([7, 9, 13, 21, 16, 18, 22, 15, 17, 32]),
      'desafio14': () => _desafio14([2, 3, 4, 5, 6, 7, 8, 9, 10, 15]),
      'desafio15': () => _desafio15(2),
      'desafio16': () => _desafio16('Arara'),
      'desafio17': () => _desafio17(10),
      'desafio18': () => _desafio18(
          "um", "Eu posso comer um McDonald's, um BurgerKing e um Popeyes"),
    };

    if (challengeFunctions.containsKey(_nameChallenge)) {
      challengeFunctions[_nameChallenge]!();
    }
  }

  void _desafio1(int valueA, int valueB) {
    setState(() {
      if (valueA > valueB) {
        _result = "O maior número entre $valueA e $valueB é $valueA.";
      } else {
        _result = "O maior número entre $valueA e $valueB é $valueB.";
      }
    });
  }

  void _desafio2(int valueA, int valueB, int valueC) {
    int sum = valueA + valueB;
    setState(() {
      _result =
          'A soma de $valueA + $valueB é $sum, esse número ${sum > valueC ? 'é maior que' : 'não é maior que'} $valueC';
    });
  }

  void _desafio3(int fatorial) {
    int result = 1;
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

  void _desafio5(int a, int b) {
    String resultTexto = '';
    int soma = 0;
    int multiplicacao = 0;

    if (a == b) {
      soma = a + b;
      resultTexto = 'Os números são iguais, a soma é $soma';
    } else {
      multiplicacao = a * b;
      resultTexto =
          'Os números são diferentes, a multiplicação é $multiplicacao';
    }

    setState(() {
      _result = resultTexto;
    });
  }

  void _desafio6(int numero) {
    int antecessor = numero - 1;
    int sucessor = numero + 1;

    setState(() {
      _result =
          'O antecessor de $numero é $antecessor, e o sucessor é $sucessor.';
    });
  }

  void _desafio7(double userSalary, double minimumSalary) {
    double salaryMultiplier = userSalary / minimumSalary;
    setState(() {
      _result =
          'O usuário recebe um salário igual a ${salaryMultiplier.toStringAsFixed(2)} vezes o salário mínimo.';
    });
  }

  void _desafio8(valueA, valueB, valueC) {
    List<int> listNumber = [valueA, valueB, valueC];

    String list = 'A lista de números é: $listNumber ';
    listNumber.sort((a, b) => -a.compareTo(b));
    String descending = 'e a ordem decrescente da lista fica: $listNumber';

    setState(() {
      _result = list.toString() + descending.toString();
    });
  }

  void _desafio9(List<double> notas) {
    double soma = notas.reduce((a, b) => a + b);
    double media = soma / notas.length;
    String mediaString = media.toStringAsFixed(2);
    String resultado;
    if (media >= 7) {
      resultado = 'aprovado';
    } else {
      resultado = 'reprovado';
    }
    setState(() {
      _result = 'Média $mediaString, aluno $resultado';
    });
  }

  void _desafio10(String name, int idade) {
    String result = '';
    if (idade >= 18) {
      result = 'é maior';
    } else {
      result = 'é menor';
    }
    setState(() {
      _result = '$name você $result de idade';
    });
  }

  void _desafio11(int number) async {
    List<int> table = [];
    for (int contador = 1; contador <= 10; contador++) {
      table.add(number * contador);
    }
    setState(() {
      _result = table.join(', ');
    });
  }

  void _desafio12(List<int> numbers) {
    List<int> square = [];
    for (int number in numbers) {
      square.add(number * number);
    }
    setState(() {
      _result = 'entrada = $numbers \n saída = $square';
    });
  }

  void _desafio13(List<int> numeros) {
    int contadorPar = 0;
    int contadorImpar = 0;

    for (int number in numeros) {
      if (number % 2 == 0) {
        contadorPar++;
      } else {
        contadorImpar++;
      }
    }

    setState(() {
      _result =
          'A lista de números é: $numeros e tem $contadorPar números pares e $contadorImpar números ímpares';
    });
  }

  void _desafio14(List<int> numbers) {
    int menor = numbers[0];
    int maior = numbers[0];

    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] < menor) {
        menor = numbers[i];
      }
      if (numbers[i] > maior) {
        maior = numbers[i];
      }
    }
    setState(() {
      _result =
          'Entrada: $numbers maior numero é $maior, o numero menor é $menor ';
    });
  }

  void _desafio15(int valueA) {
    List<int> numbers = [];
    for (int i = 0; i <= valueA; i++) {
      numbers.add(i);
    }
    setState(() {
      _result = numbers.toString();
    });
  }

  void _desafio16(String text) {
    String textReversed = text.split('').reversed.join('');
    bool isPalindrom = text.toLowerCase() == textReversed.toLowerCase();

    setState(() {
      _result =
          '$text | $textReversed - ${isPalindrom ? 'é um palíndromo' : 'não é um palíndromo'}';
    });
  }

  void _desafio17(int number) {
    String result = '';
    if (number > 1) {
      result = 'é primo';
      for (int i = 2; i <= number / 2; i++) {
        if (number % i == 0) {
          result = 'não é primo';
          break;
        }
      }
    }
  }

  void _desafio18(String palavra, String frase) {
    List<String> palavrasNaFrase = frase.split(' ');
    int contador = 0;

    for (String palavraNaFrase in palavrasNaFrase) {
      if (palavraNaFrase.toLowerCase() == palavra.toLowerCase()) {
        contador++;
      }
    }
    setState(() {
      _result =
          '$frase\n A palavra "$palavra" aparece $contador vezes na frase.';
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
            DropdownButton<String>(
              hint: const Text(
                'Escolha um desafio',
              ),
              value: _nameChallenge,
              items: _challengesList,
              onChanged: (String? value) {
                setState(() {
                  _nameChallenge = value;
                });
              },
            ),
            ButtonCalculate(
              callChallenge: () {
                callChallenge();
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
