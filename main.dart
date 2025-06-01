import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(SimRepairProfitApp());
}

class SimRepairProfitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIM & Repair Profit Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfitTrackerPage(),
    );
  }
}

class ProfitTrackerPage extends StatefulWidget {
  @override
  _ProfitTrackerPageState createState() => _ProfitTrackerPageState();
}

class _ProfitTrackerPageState extends State<ProfitTrackerPage> {
  final List<Sale> simSales = [];
  final List<Repair> repairs = [];

  final simCostController = TextEditingController(text: '1.0'); // fixed cost per SIM
  final simPriceController = TextEditingController();
  final repairIncomeController = TextEditingController();
  final repairCostController = TextEditingController();

  double get totalSimProfit {
    double cost = double.tryParse(simCostController.text) ?? 0;
    double profit = 0;
    for (var sale in simSales) {
      profit += (sale.sellingPrice - cost);
    }
    return profit;
  }

  double get totalRepairProfit {
    double profit = 0;
    for (var r in repairs) {
      profit += (r.income - r.cost);
    }
    return profit;
  }

  double get totalProfit => totalSimProfit + totalRepairProfit;

  @override
  void dispose() {
