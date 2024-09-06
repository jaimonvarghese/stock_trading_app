// providers/watchlist_provider.dart
import 'package:flutter/material.dart';
import '../models/stock.dart';

class WatchlistProvider with ChangeNotifier {
  List<Stock> _watchlist = [];

  List<Stock> get watchlist => _watchlist;

  void addStock(Stock stock) {
    if (_watchlist.length < 2) {
      _watchlist.add(stock);
      notifyListeners();
    }
  }

  void removeStock(Stock stock) {
    _watchlist.remove(stock);
    notifyListeners();
  }
}
