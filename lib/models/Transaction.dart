import 'User.dart';

class Transaction {
  final int amount;
  final DateTime transactionDate;
  User? sender;
  User? receiver;

  Transaction(this.amount, this.transactionDate);

  Transaction.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        transactionDate = json['transactionDate'],
        sender = json['sender'],
        receiver = json['receiver'];

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'transactionDate': transactionDate,
        'sender': sender,
        'receiver': receiver
      };
}
