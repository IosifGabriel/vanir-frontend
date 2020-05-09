class Transaction {
  final String id;
  final String recipient;
  final double amount;
  final String date;
  final String currency;

  Transaction({this.id, this.recipient, this.amount, this.date, this.currency});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      recipient: json['recipient'],
      amount: json['amount'],
      date: json['date'],
      currency: json['currency'],
    );
  }
}
