// models/stock.dart
class Stock {
  final String symbol;
  final double currentPrice;
  final double changePercentage;

  Stock({
    required this.symbol,
    required this.currentPrice,
    required this.changePercentage,
  });
}
