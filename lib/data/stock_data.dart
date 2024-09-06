// data/stock_data.dart
import '../models/stock.dart';

final List<Stock> stocks = [
  Stock(symbol: 'AAPL', currentPrice: 145.32, changePercentage: -0.75),
  Stock(symbol: 'GOOGL', currentPrice: 2735.55, changePercentage: 1.23),
  Stock(symbol: 'MSFT', currentPrice: 289.67, changePercentage: -0.40),
  // Add more static stocks
];
