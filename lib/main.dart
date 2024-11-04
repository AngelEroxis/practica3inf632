import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Ejercicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Verificar Palíndromo'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PalindromeScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Identificar Números Amigos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FriendlyNumbersScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Convertir Número a Binario'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BinaryConverterScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PalindromeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  bool isPalindrome(String text) {
    String cleanedText = text.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join();
    return cleanedText == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificar Palíndromo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingresa un texto'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Verificar'),
              onPressed: () {
                bool result = isPalindrome(_controller.text);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(
                        result ? 'Es un palíndromo' : 'No es un palíndromo'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FriendlyNumbersScreen extends StatelessWidget {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  bool areFriendlyNumbers(int a, int b) {
    int sumDivisors(int n) {
      int sum = 0;
      for (int i = 1; i <= n / 2; i++) {
        if (n % i == 0) sum += i;
      }
      return sum;
    }

    return sumDivisors(a) == b && sumDivisors(b) == a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Identificar Números Amigos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration:
                  InputDecoration(labelText: 'Ingresa el primer número'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration:
                  InputDecoration(labelText: 'Ingresa el segundo número'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Verificar'),
              onPressed: () {
                int num1 = int.parse(_num1Controller.text);
                int num2 = int.parse(_num2Controller.text);
                bool result = areFriendlyNumbers(num1, num2);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(result
                        ? 'Son números amigos'
                        : 'No son números amigos'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BinaryConverterScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  String toBinary(int number) {
    return number.toRadixString(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Convertidor de Número a Binario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  InputDecoration(labelText: 'Ingresa un número entero'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Convertir'),
              onPressed: () {
                int number = int.parse(_controller.text);
                String binary = toBinary(number);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('Representación binaria: $binary'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
