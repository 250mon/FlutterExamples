import 'package:flutter/material.dart';
import '../animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal> animalList;

  const FirstApp({super.key, required this.animalList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return GestureDetector(
                  child: Card(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            animalList[position].imagePath!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                          Text(animalList[position].animalName!)
                        ],
                      )
                  ),
                  onTap: () {
                    AlertDialog dialog = AlertDialog(
                      content: Text(
                        'This is ${animalList[position].kind}',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => dialog
                    );
                  }
              );
            },
            itemCount: animalList.length,
          ),
        ),
    );
  }
}
