class Expense {
  int? id;
  String title;
  double amount;
  DateTime date;
  String category;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  // Convert Expense to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
    };
  }

  // Convert a Map to an Expense
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
      category: map['category'],
    );
  }
}
