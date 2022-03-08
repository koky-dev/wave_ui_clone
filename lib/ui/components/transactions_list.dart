import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:wave_ui_clone/ui/screens/transaction_details.dart';

class TransactionsListComponent extends StatelessWidget {
  TransactionsListComponent({Key? key}) : super(key: key);

  final List transactionItems = [
    {
      "type": "sending",
      "amount": 15000,
      "date": 'janv. 15, 19:15',
      "correspondant": "Daam Siise 70 458 29 08",
      'id': 'ASXDF567',
      'frais': 150,
      'agent': "",
    },
    {
      "type": "depot",
      "amount": 12000,
      "date": 'Fév. 12, 06:44',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "Fongolemi Service",
    },
    {
      "type": "retrait",
      "amount": 26000,
      "date": 'Déc. 05, 14:18',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "Mbulaxteen Service",
    },
    {
      "type": "depot",
      "amount": 300000,
      "date": 'janv. 03, 17:59',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "Ngunjaan Service",
    },
    {
      "type": "receiving",
      "amount": 62000,
      "date": 'oct. 2, 00:49',
      "correspondant": "Moor Gajaga 77 098 34 07",
      'id': 'ASXDF567',
      'frais': 620,
      'agent': "",
    },
    {
      "type": "receiving",
      "amount": 15000,
      "date": 'janv. 5, 10:45',
      "correspondant": "Naar Juuf 70 543 67 48",
      'id': 'ASXDF567',
      'frais': 150,
      'agent': "",
    },
    {
      "type": "sending",
      "amount": 54000,
      "date": 'janv. 15, 19:15',
      "correspondant": "Majigéen Jaw 77 874 00 11",
      'id': 'ASXDF567',
      'frais': 540,
      'agent': "",
    },
    {
      "type": "depot",
      "amount": 43000,
      "date": 'janv. 10, 08:08',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "Ngaay MultiService",
    },
    {
      "type": "depot",
      "amount": 2000,
      "date": 'Fév. 15, 9:17',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "Pekees Service",
    },
    {
      "type": "receiving",
      "amount": 15000,
      "date": 'janv. 15, 11:19',
      "correspondant": "Masire Jaañ 70 458 29 08",
      'id': 'ASXDF567',
      'frais': 150,
      'agent': "",
    },
    {
      "type": "retrait",
      "amount": 25000,
      "date": 'dec. 15, 14:53',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "Jaobe Multiservice",
    },
    {
      "type": "sending",
      "amount": 50000,
      "date": 'janv. 15, 19:15',
      "correspondant": "Ngañ Sekk 75 905 13 40",
      'id': 'ASXDF567',
      'frais': 500,
      'agent': "",
    },
    {
      "type": "depot",
      "amount": 67000,
      "date": 'janv. 3, 03:28',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "",
    },
    {
      "type": "receiving",
      "amount": 80000,
      "date": 'Fevr. 02, 02:39',
      "correspondant": "Abdu Lahad Nduur 76 123 65 87",
      'id': 'ASXDF567',
      'frais': 800,
      'agent': "",
    },
    {
      "type": "retrait",
      "amount": 65000,
      "date": 'Fév. 06, 12:48',
      "correspondant": "",
      'id': 'ASXDF567',
      'frais': 0,
      'agent': "Libert 6",
    },
    {
      "type": "receiving",
      "amount": 26000,
      "date": 'janv. 15, 19:15',
      "correspondant": "Mbay Faal 70 235 98 08",
      'id': 'ASXDF567',
      'frais': 260,
      'agent': "",
    },
  ];
  NumberFormat formatNumber = NumberFormat.decimalPattern('fr_sn');

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactionItems.map((transaction) {
      // Format number & display (-) sign if it is send or retrait money
      var amountToShow =
          transaction['type'] == 'depot' || transaction['type'] == 'receiving'
              ? '${formatNumber.format(transaction['amount'])}F'
              : '-${formatNumber.format(transaction['amount'])}F';

      return GestureDetector(
        child: ListTile(
          title: transaction['type'] == 'depot'
              ? const Text('Dépôt')
              : transaction['type'] == 'retrait'
                  ? const Text('Retrait')
                  : transaction['type'] == 'sending'
                      ? Text('À ${transaction['correspondant']}')
                      : Text('De ${transaction['correspondant']}'),
          subtitle: Text(transaction['date']),
          trailing: Text(amountToShow.toString()),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetails(
                transaction: transaction,
              ),
            ),
          );
        },
      );
    }).toList());
  }
}
