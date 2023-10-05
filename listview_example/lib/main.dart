import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import 'animalItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ListView Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(animalName: "Bee", kind: "Insect",
        imagePath: "assets/images/bee.png"));
    animalList.add(Animal(animalName: "Cat", kind: "Mammal",
        imagePath: "assets/images/cat.png"));
    animalList.add(Animal(animalName: "Cow", kind: "Mammal",
        imagePath: "assets/images/cow.png"));
    animalList.add(Animal(animalName: "Dog", kind: "Mammal",
        imagePath: "assets/images/dog.png"));
    animalList.add(Animal(animalName: "Fox", kind: "Mammal",
        imagePath: "assets/images/fox.png"));
    animalList.add(Animal(animalName: "Monkey", kind: "Mammal",
        imagePath: "assets/images/monkey.png"));
    animalList.add(Animal(animalName: "Pig", kind: "Mammal",
        imagePath: "assets/images/pig.png"));
    animalList.add(Animal(animalName: "Wolf", kind: "Mammal",
        imagePath: "assets/images/wolf.png"));
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          FirstApp(animalList: animalList,),
          SecondApp(animalList: animalList,),
        ],
      ),

      // Center(
      //   child: Column(
      //     children: <Widget>[
      //       TabBarView(
      //         controller: controller,
      //         children: <Widget>[FirstApp(), SecondApp()],
      //       )
      //     ],
      //   ),
      // ),

      bottomNavigationBar: TabBar(tabs: const <Tab>[
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
        Tab(icon: Icon(Icons.looks_two, color: Colors.blue),),
      ],controller: controller,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => print("add button pressed"),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
