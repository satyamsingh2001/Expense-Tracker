// ignore_for_file: unnecessary_string_interpolations, invalid_use_of_protected_member

import 'package:expense_tracker/colors/colors_const.dart';
import 'package:expense_tracker/common/widgets/const_container.dart';
import 'package:expense_tracker/const/const_height.dart';
import 'package:expense_tracker/screen/home/controllers/home_controller.dart';
import 'package:expense_tracker/styles/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/pie_charts.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Expense Tracker",
          style: AppTextStyles.kBody15SemiBoldTextStyle
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Pie chart widget
          Obx(() => PieChartWidget(
              expenses: controller.expenseController.expenses.value)),
          // List of added entries
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.expenseController.expenses.length,
                itemBuilder: (context, index) {
                  final expense = controller.expenseController.expenses[
                      controller.expenseController.expenses.length - 1 - index];
                  return Column(
                    children: [
                      ListTile(
                        onLongPress: () => controller.expenseController
                            .deleteExpense(expense.id ?? 0),
                        // tileColor: AppColors.error10,
                        title: Text(
                          expense.title.toUpperCase(),
                          style: AppTextStyles.kSmall10SemiBoldTextStyle,
                        ),
                        subtitle: Text(
                          '₹${expense.amount}',
                          style: AppTextStyles.kSmall8RegularTextStyle,
                        ),
                        trailing: Text('${expense.category}'),
                      ),
                      ConstantContainer(
                        height: h1,
                        color: AppColors.white40,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          controller.showAddExpenseDialog(context);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
