import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../colors.dart';

class NewContact extends StatefulWidget {
  const NewContact({Key? key}) : super(key: key);

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _number = TextEditingController();

  late bool _isButtonEnabled = false;

  //String initialCountry = 'NG';
  String _hintText = '7X XXX XX XX';
  PhoneNumber number = PhoneNumber(isoCode: 'SN');

  late String fullName;
  late PhoneNumber _phoneNumberValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isButtonEnabled = false;
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
          key: _formKey,
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
                  TextFormField(
                    controller: _fullName,
                    autofocus: true,
                    decoration: const InputDecoration(
                      label: Text('Nom complet'),
                    ),
                    onChanged: (value) => fullName = value,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InternationalPhoneNumberInput(
                    countries: ['SN', 'CI'],
                    initialValue: number,
                    inputBorder: UnderlineInputBorder(),
                    hintText: _hintText,
                    textFieldController: _number,
                    onInputValidated: (value) {
                      setState(() {
                        _isButtonEnabled = value ? true : false;
                      });
                      //print(value);
                    },
                    onInputChanged: (value) {
                      print(value);
                      _phoneNumberValue = value;
                    },
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
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                    //   (Set<MaterialState>() states)
                    // ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => skyBlue),
                  ),
                  onPressed: _isButtonEnabled ? () {} : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
