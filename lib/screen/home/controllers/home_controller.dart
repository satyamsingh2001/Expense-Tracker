import 'package:expense_tracker/const/const_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../colors/colors_const.dart';
import '../../../common/widgets/const_dropdown.dart';
import '../models/expense_model.dart';
import 'expense_controller.dart';

class HomeController extends GetxController {
  final ExpenseController expenseController = Get.find();

  final titleController = TextEditingController().obs;
  final amountController = TextEditingController().obs;
  RxString categoryController = RxString(''); // Updated to RxString

  final RxList<Expense> expenses = <Expense>[].obs;
  final RxList<String> selectedCategories = <String>[
    "Food",
    "Transport",
    "Movies",
    "Entertainment",
    "Others",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    expenseController.fetchExpenses();
  }

  void updateSelectedCategories() {
    List<String> categories = [];
    for (var expense in expenses) {
      categories.addAll(expense.category.split(
          ',')); // Split categories if they are stored as comma-separated
    }
    selectedCategories.value = categories.toSet().toList();
  }

  Future<void> addExpense() async {
    final title = titleController.value.text;
    final amount = double.tryParse(amountController.value.text) ?? 0.0;
    final category = categoryController.value;

    debugPrint("Title: $title");
    debugPrint("Amount: $amount");
    debugPrint("Category: $category");

    if (title.isNotEmpty && amount > 0 && category.isNotEmpty) {
      await expenseController.addExpense(
          title: title,
          amount: amount,
          date: DateTime.now(),
          category: category); // Pass category directly
      clearFields();
      expenseController
          .fetchExpenses(); // Refresh the expense list after adding a new expense
      debugPrint("Expense added successfully!");
      Get.snackbar('Added', 'Expense',
          backgroundColor: AppColors.success80, colorText: AppColors.white);
    } else {
      Get.snackbar(
          'Error', 'Please enter valid title, amount, and select a category.',
          backgroundColor: AppColors.error40, colorText: AppColors.white);
    }
  }

  void clearFields() {
    titleController.value.clear();
    amountController.value.clear();
    categoryController.value = '';
  }

  Future<void> showAddExpenseDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w)),
          backgroundColor: AppColors.white,
          title: const Text('Add Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstantDropdown(
                textColor: AppColors.white100,
                dropdownColor: AppColors.white,
                iconColor: AppColors.white100,
                hint: "Select Category",
                options: selectedCategories,
                onChanged: (value) {
                  categoryController.value =
                      value; // Update categoryController value
                },
              ),
              SizedBox(height: h3),
              TextField(
                controller: titleController.value,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: amountController.value,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addExpense();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
