import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/expense_model.dart';
import '../services/db/expense_db.dart';

class ExpenseController extends GetxController {
  final ExpenseDatabase _expenseDatabase = ExpenseDatabase.instance;

  RxList<Expense> expenses = <Expense>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchExpenses();
  }

  Future<void> addExpense({
    required String title,
    required double amount,
    required DateTime date,
    required String category,
  }) async {
    try {
      Expense expense = Expense(
        title: title,
        amount: amount,
        date: date,
        category: category,
      );

      await _expenseDatabase.insertExpense(expense);
      fetchExpenses(); // Update the list of expenses
    } catch (e) {
      debugPrint("Error adding expense: $e");
    }
  }

  Future<void> fetchExpenses() async {
    try {
      expenses.value = await _expenseDatabase.getExpenses();
    } catch (e) {
      debugPrint("Error fetching expenses: $e");
    }
  }

  Future<void> deleteExpense(int id) async {
    try {
      await _expenseDatabase.deleteExpense(id);
      fetchExpenses(); // Update the list of expenses
    } catch (e) {
      debugPrint("Error deleting expense: $e");
    }
  }
}
