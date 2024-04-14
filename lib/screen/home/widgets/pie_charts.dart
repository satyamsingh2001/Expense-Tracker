import 'package:expense_tracker/colors/colors_const.dart';
import 'package:expense_tracker/const/const_height.dart';
import 'package:expense_tracker/const/const_strings.dart';
import 'package:expense_tracker/styles/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

import '../models/expense_model.dart';

class PieChartWidget extends StatelessWidget {
  final List<Expense> expenses;

  const PieChartWidget({required this.expenses, super.key});

  @override
  Widget build(BuildContext context) {
    // Data for the pie chart
    Map<String, double> dataMap = {};
    double totalAmount = 0;
    for (var expense in expenses) {
      final double amount = expense.amount;
      totalAmount += amount;
      if (amount > 0 && expense.category.isNotEmpty) {
        final List<String> categories = expense.category
            .split(',')
            .map((category) => category.trim())
            .toList();
        for (var category in categories) {
          dataMap[category] = (dataMap[category] ?? 0) + amount;
        }
      }
    }

    // Check if dataMap is empty
    if (dataMap.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              noData,
              fit: BoxFit.cover,
              height: h50,
            ),
            Text(
              'Add Your Expenses',
              style: AppTextStyles.kBody15RegularTextStyle,
            ),
          ],
        ),
      );
    }

    // Colors for each segment of the pie chart
    List<Color> colorList = [
      const Color(0xffD95AF3),
      const Color(0xff3EE094),
      const Color(0xff3398F6),
      const Color(0xffFA4A42),
      const Color(0xffFE9539)
    ];

    // List of gradients for the background of the pie chart
    final gradientList = <List<Color>>[
      [
        const Color.fromRGBO(223, 250, 92, 1),
        const Color.fromRGBO(129, 250, 112, 1)
      ],
      [
        const Color.fromRGBO(129, 182, 205, 1),
        const Color.fromRGBO(91, 253, 199, 1)
      ],
      [
        const Color.fromRGBO(175, 63, 62, 1.0),
        const Color.fromRGBO(254, 154, 92, 1)
      ],
    ];

    return Column(
      children: [
        // PieChart
        Center(
          child: PieChart(
            dataMap: dataMap,
            colorList: colorList,
            chartRadius: 150.w,
            centerText: "Expense",
            ringStrokeWidth: 24,
            animationDuration: const Duration(seconds: 3),
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: true,
              showChartValuesOutside: true,
              showChartValuesInPercentage: true,
              showChartValueBackground: false,
            ),
            legendOptions: LegendOptions(
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: AppTextStyles.kSmall10RegularTextStyle,
              legendPosition: LegendPosition.bottom,
              showLegendsInRow: true,
            ),
            gradientList: gradientList,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(' Total Expenses: ₹${totalAmount.toStringAsFixed(2)} ',
              style: AppTextStyles.kCaption12SemiBoldTextStyle
                  .copyWith(color: AppColors.white50)),
        ),
      ],
    );
  }
}
