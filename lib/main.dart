// main.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/stock_data.dart';
import 'models/stock.dart';
import 'providers/watchlist_provider.dart';
import 'widgets/stock_chart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WatchlistProvider(),
      child: StockTradingApp(),
    ),
  );
}

class StockTradingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Trading App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final watchlistProvider = Provider.of<WatchlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Trading App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                Stock stock = stocks[index];
                return ListTile(
                  title: Text(stock.symbol),
                  subtitle:
                      Text('Price: \$${stock.currentPrice.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      watchlistProvider.addStock(stock);
                    },
                  ),
                );
              },
            ),
          ),
          Divider(),
          Text(
            'Watchlist',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // main.dart (Add this section under Watchlist)
          Expanded(
            child: ListView.builder(
              itemCount: watchlistProvider.watchlist.length,
              itemBuilder: (context, index) {
                Stock stock = watchlistProvider.watchlist[index];
                List<FlSpot> stockPrices = [
                  FlSpot(0, stock.currentPrice - 2),
                  FlSpot(1, stock.currentPrice - 1),
                  FlSpot(2, stock.currentPrice),
                ]; // Mocked data for the chart

                return Column(
                  children: [
                    ListTile(
                      title: Text(stock.symbol),
                      subtitle: Text(
                          'Price: \$${stock.currentPrice.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          watchlistProvider.removeStock(stock);
                        },
                      ),
                    ),
                    StockChart(pricePoints: stockPrices),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
