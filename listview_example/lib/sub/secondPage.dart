import 'package:flutter/material.dart';
import '../animalItem.dart';

class SecondApp extends StatefulWidget {

  @override
  State<SecondApp> createState() => _SecondAppState();
  List<Animal> animalList;

  SecondApp({super.key, required this.animalList});
}

class _SecondAppState extends State<SecondApp> {
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;

  void _radioChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _checkboxChange(bool check) {
    setState(() {
      flyExist = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });},
                ),
                const Text('Amphibian'),
                // Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange,),
                const Text('Reptile'),
                // Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange,),
                const Text('Mammal'),
              ]
            ),
            Row(
             children: <Widget>[
               const Text('Can it fly?'),
               Checkbox(
                   value: flyExist,
                   onChanged: null, //_checkboxChange,
               )
             ],
            ),
          ],
        )
      )
    );
  }

}