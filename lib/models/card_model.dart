class CreditCard {
  final int id;
  final String cardholderName;
  final String number;
  final String expirationDate;
  final String cvv;

  CreditCard({this.id, this.cardholderName, this.number, this.expirationDate, this.cvv});

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      id: json['id'],
      cardholderName: json['cardholderName'],
      number: json['number'],
      expirationDate: json['expirationDate'],
      cvv: json['cvv'],
    );
  }
}