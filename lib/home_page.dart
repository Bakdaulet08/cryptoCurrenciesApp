import 'package:flutter/material.dart';
import 'cryptoCoinsList.dart';
import 'crypto_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CryptoCoinsList cryptoCoinsList = CryptoCoinsList();
  bool isLoading = true; // Для отслеживания состояния загрузки

  @override
  void initState() {
    super.initState();
    _fetchCryptoPrices(); // Загружаем данные при инициализации
  }

  Future<void> _fetchCryptoPrices() async {
    await cryptoCoinsList.updateCryptoPrices(); // Обновляем цены из API
    setState(() {
      isLoading = false; // Обновляем состояние после загрузки
    });
  }

  Widget _buildCryptoTile(BuildContext context, int index) {
    final crypto = cryptoCoinsList.cryptoData[index];
    return Column(
      children: [
        if (index == 0) const SizedBox(height: 6.5),
        const SizedBox(height: 6.5),
        ListTile(

          title: Text(
            crypto[0], // Название криптовалюты
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            '\$${crypto[1]}', // Цена криптовалюты
            style: Theme.of(context).textTheme.bodySmall,
          ),
          leading: Image.asset(
            crypto[2], // Логотип криптовалюты
            height: 40,
            width: 40,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CryptoPage(indexOfCrypto: index),
              ),
            );
          },
        ),
        const SizedBox(height: 6.5),
        if (index < cryptoCoinsList.cryptoData.length - 1)
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // Цвет фона
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Crypto Currency App",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.yellow[700],
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(), // Индикатор загрузки
      )
          : ListView.builder(
        itemCount: cryptoCoinsList.cryptoData.length, // Количество криптовалют
        itemBuilder: (context, index) => _buildCryptoTile(context, index),
      ),
    );
  }
}
