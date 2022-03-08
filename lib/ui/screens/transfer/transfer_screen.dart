import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_ui_clone/ui/colors.dart';

class TransferScreen extends StatefulWidget {
  final fullName;
  final phoneNumber;
  const TransferScreen(
      {Key? key, required this.fullName, required this.phoneNumber})
      : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _receiverController = TextEditingController();
  late TextEditingController _amountToSend = TextEditingController();
  late var _amountToBeReceived = TextEditingController();

  @override
  void dispose() {
    _receiverController.dispose();
    _amountToSend.dispose();
    _amountToBeReceived.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Envoyer de l'argent",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        //width: MediaQuery.of(context).size.width * 0.96,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: const Text('À'),
                    margin: const EdgeInsets.only(left: 15),
                  ),
                  TextFormField(
                    //readOnly: true,
                    enabled: false,
                    decoration: InputDecoration(
                        label: ListTile(
                          title: Text(
                            widget.fullName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: darkBlue),
                          ),
                          subtitle: Text(widget.phoneNumber),
                        ),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: skyBlue))),
                  ),
                  TextFormField(
                    controller: _amountToSend,
                    keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[
                    //   WhitelistingTextInputFormatter.digitsOnly,
                    // ],
                    decoration: const InputDecoration(
                      label: Text('Montant Envoyé'),
                    ),
                    onChanged: (value) {
                      setState(() {
                        this._amountToBeReceived.text =
                            int.parse(value * 2) as String;
                      });
                    },
                  ),
                  TextFormField(
                    controller: _amountToBeReceived,
                    decoration: const InputDecoration(
                      label: Text('Montant Reçu'),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Column(
                      children: const [
                        Text(
                          'Frais Wave = 1%',
                          style: TextStyle(color: skyBlue),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Frais maximum: 5000F',
                          style: TextStyle(color: skyBlue),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  child: const Text('Envoyer'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
