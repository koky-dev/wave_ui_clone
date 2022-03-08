class User {
  final String name;
  final String number;
  final int balance;

  User(this.name, this.number, this.balance);

  User.formJson(Map<String, dynamic> json)
      : name = json['name'],
        number = json['number'],
        balance = json['balance'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'number': number, 'balance': balance};
}
