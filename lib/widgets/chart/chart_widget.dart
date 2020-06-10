import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:vanir_app/models/transaction_model.dart';
import 'package:vanir_app/services/transactions_service.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/not_found.dart';

class AnalyticsChart extends StatefulWidget {
  @override
  _AnalyticsChartState createState() => _AnalyticsChartState();
}

class _AnalyticsChartState extends State<AnalyticsChart> {
  Future<List<Transaction>> futureTransactions;

  @override
  void initState() {
    super.initState();
    futureTransactions = TransactionsService.getTransactions();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: futureTransactions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) return NotFoundView();
          var data = snapshot.data.map((t) => t.amount).toList();
          return _view(data);
        } else if (snapshot.hasError) {
          return ErrorView();
        }
        return Loader();
      },
    );
  }

  Widget _view(List<double> data) {
    return Container(
      height: 200.0,
      child: Sparkline(
        data: data,
        lineWidth: 2.0,
        lineColor: Theme.of(context).primaryColor,
        pointsMode: PointsMode.all,
        pointSize: 8.0,
        pointColor: Theme.of(context).primaryColor,
        fillMode: FillMode.below,
        fillGradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).accentColor.withOpacity(0.5),
            Theme.of(context).scaffoldBackgroundColor
          ],
        ),
      ),
    );
  }
}
