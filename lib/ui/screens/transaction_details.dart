import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wave_ui_clone/ui/colors.dart';

class TransactionDetails extends StatelessWidget {
  final transaction;
  const TransactionDetails({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('fr_sn');
    var subtitleText = transaction['type'] == 'retrait'
        ? 'Retrait'
        : transaction['type'] == 'depot'
            ? 'Dépôt'
            : transaction['type'] == 'sending'
                ? 'À ${transaction['correspondant']}'
                : 'De ${transaction['correspondant']}';

    var amountText = transaction['type'] == 'retrait'
        ? 'Montant Retiré'
        : transaction['type'] == 'depot'
            ? 'Montant déposé'
            : 'Montant reçu';

    var amountToShow =
        transaction['type'] == 'retrait' || transaction['type'] == 'sending'
            ? '-${myFormat.format(transaction['amount'])}F'
            : '${myFormat.format(transaction['amount'])}F';

    var amountReceived = myFormat.format(transaction['amount']);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            transaction['type'] == 'sending' ||
                    transaction['type'] == 'receiving'
                ? Container(
                    width: 35,
                    height: 35,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: skyPurple,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.person,
                      color: backgroundPurple,
                    ),
                  )
                : transaction['type'] == 'retrait'
                    ? Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: skyBlue,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: skyBlue,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
            ListTile(
              title: Text(
                amountToShow,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                subtitleText,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            transaction['type'] == 'sending'
                ? ListTile(
                    subtitle: Text(amountReceived,
                        style: const TextStyle(color: Colors.black)),
                    title: Text(
                      amountText,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  )
                : ListTile(
                    subtitle: Text(amountToShow,
                        style: const TextStyle(color: Colors.black)),
                    title: Text(
                      amountText,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
            ListTile(
              subtitle: Text('${transaction['frais']}F',
                  style: const TextStyle(color: Colors.black)),
              title: const Text(
                'Frais',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const ListTile(
              subtitle: Text('Effectué', style: TextStyle(color: Colors.black)),
              title: Text(
                'Statut',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            transaction['agent'] != ""
                ? ListTile(
                    subtitle: Text(transaction['agent'],
                        style: const TextStyle(color: Colors.black)),
                    title: const Text(
                      "Nom de l'agent",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : Container(),
            ListTile(
              subtitle: Text(transaction['date'],
                  style: const TextStyle(color: Colors.black)),
              title: const Text(
                'Date et heure',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              subtitle: Text(transaction['id'],
                  style: const TextStyle(color: Colors.black)),
              title: const Text(
                'ID de la transaction',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 18),
              child: const Text('En partenariat avec UBA',
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
