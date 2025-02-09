import 'package:flutter/material.dart';

import 'cryptoCoinsList.dart';

class CryptoPage extends StatefulWidget {
  final int indexOfCrypto; // Сделано полем класса

  const CryptoPage({super.key, required this.indexOfCrypto}); // Обязательный параметр

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  final CryptoCoinsList cryptoCoinsList = CryptoCoinsList();

  @override
  Widget build(BuildContext context) {
    final crypto = cryptoCoinsList.cryptoData[widget.indexOfCrypto]; // Доступ к данным через indexOfCrypto

    return Scaffold(
      appBar: AppBar(
        title: Text(crypto[0]), // Название криптовалюты

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              crypto[2], // Логотип криптовалюты
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Text(
              crypto[0], // Название
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '\$${crypto[1]}', // Цена
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
