class Transaction {
  final int id;
  final String recipient;
  final String recipientAvatar;
  final double amount;
  final String date;
  final String currency;

  Transaction({this.id, this.recipient, this.recipientAvatar, this.amount, this.date, this.currency});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      recipient: json['recipientName'],
      recipientAvatar: json['recipientAvatar'],
      amount: json['amount'],
      date: json['date'],
      currency: json['currency'],
    );
  }
}
