import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatelessWidget {
  final Map WorldData;

  const Chart({Key key, this.WorldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(25)
          ),
          margin: EdgeInsets.all(5),
          height: 180,
          width: width/1.2,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: PieChart(
              chartType: ChartType.ring,
              ringStrokeWidth: 45,

              animationDuration: Duration(milliseconds: 1000),
              dataMap: {
              'CONFIRMER':WorldData['cases'].toDouble(),
              'ACTIVE':WorldData['active'].toDouble(),
              'RECOVERED':WorldData['recovered'].toDouble(),
              'DEATHS':WorldData['deaths'].toDouble(),
            },
              colorList: [
                Colors.red[900],
                Colors.blue[900],
                Colors.green[800],
                Colors.black,
              ],
              legendOptions: LegendOptions(
                legendTextStyle: TextStyle(color: Colors.white,)
              ),
              chartRadius:70,
              chartValuesOptions: ChartValuesOptions(
                chartValueStyle: TextStyle(color: Colors.white,fontSize: 10),
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

