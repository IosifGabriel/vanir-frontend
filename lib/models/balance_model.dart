class Balance {
  final double balance;
  final String currency;
  final String ronRate;
  final String usdRate;
  final String eurRate;

  Balance(
      {this.balance, this.currency, this.ronRate, this.usdRate, this.eurRate});

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      balance: json['balance'],
      currency: json['currency'],
      ronRate: json['ronRate'],
      usdRate: json['usdRate'],
      eurRate: json['eurRate'],
    );
  }
}
