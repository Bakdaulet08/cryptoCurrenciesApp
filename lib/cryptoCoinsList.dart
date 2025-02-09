import 'package:dio/dio.dart';

class CryptoCoinsList {
  final List<List<String>> cryptoData = [
    ['Bitcoin', '0', 'lib/assets/bitcoinLogo.png'],
    ['Ethereum', '0', 'lib/assets/ethereumLogo.png'],
    ['Cardano', '0', 'lib/assets/cardanoLogo.png'],
    ['Ripple', '0', 'lib/assets/pippleLogo.png'],
    ['Litecoin', '0', 'lib/assets/litecoinlogo.png'],
    ['Dogecoin', '0', 'lib/assets/dogecoinLogo.png'],
    ['Solana', '0', 'lib/assets/solanoLogo.png'],
    ['Polkadot', '0', 'lib/assets/polcadotLogo.png'],
    ['Avalanche', '0', 'lib/assets/avalancheLogo.png'],
    ['Chainlink', '0', 'lib/assets/chainlinklinkLogo.png'],
  ];

  // Метод для обновления цен из API
  Future<void> updateCryptoPrices() async {
    try {
      final response = await Dio().get(
        "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,ADA,XRP,LTC,DOGE,SOL,DOT,AVAX,LINK&tsyms=USD",
      );

      final data = response.data as Map<String, dynamic>;

      // Обновляем цены в cryptoData
      cryptoData[0][1] = data['BTC']['USD'].toString(); // Bitcoin
      cryptoData[1][1] = data['ETH']['USD'].toString(); // Ethereum
      cryptoData[2][1] = data['ADA']['USD'].toString();
      cryptoData[3][1] = data['XRP']['USD'].toString(); // Bitcoin
      cryptoData[4][1] = data['LTC']['USD'].toString(); // Ethereum
      cryptoData[5][1] = data['DOGE']['USD'].toString();
      cryptoData[6][1] = data['SOL']['USD'].toString(); // Bitcoin
      cryptoData[7][1] = data['DOT']['USD'].toString(); // Ethereum
      cryptoData[8][1] = data['AVAX']['USD'].toString();// Cardano
      cryptoData[9][1] = data['LINK']['USD'].toString();// Cardano
    } catch (e) {
      print("Ошибка загрузки данных: $e");
    }
  }
}
