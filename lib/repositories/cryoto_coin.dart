// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
//
// class CryptoCoin {
//   Future<void> getCoinsList() async{
//     final response = await Dio().get(
//       "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB&tsyms=USD"
//     );
//     final data = response.data as Map<String, dynamic>;
//     final dataList = data.entries.map((e)=> CryptoCoin(
//       name: e.key,
//       priceInUSD
//     ));
//     debugPrint(response.toString());
//   }
// }