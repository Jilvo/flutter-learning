import 'package:flutter/material.dart';
import 'choose_car.dart' as choose_car;
// import 'choose_car.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Configurateur de voiture',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isOn = true;
  int numberOfPlaces = 2;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          FilledButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text("Je valide"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "Bienvenue !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              choose_car.ChooseCar(),
              TextField(
                decoration: InputDecoration(
                  hintText: "Entrez votre nom",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 2, color: Colors.black12),
              Text(
                'Nombre de kilomètres annuel :$_counter ',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Slider(
                value: _counter.toDouble(),
                min: 0,
                max: 30000,
                divisions: 500,
                label: 'Valeur : $_counter',
                onChanged: (double value) {
                  setState(() {
                    _counter = value.toInt();
                  });
                },
              ),
              Divider(thickness: 2, color: Colors.black12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Moteur éléctrique"),
                  Switch(
                    value: isOn,
                    onChanged: (value) {
                      setState(() {
                        isOn = value;
                      });
                    },
                  ),
                ],
              ),
              Divider(thickness: 2, color: Colors.black12),
              Column(
                children: [
                  Text("Nombre de places : $numberOfPlaces"),
                  Row(
                    children: [
                      ...List.generate(4, (index) {
                        int value = index + 2;
                        return Row(
                          children: [
                            Radio<int>(
                              value: value,
                              groupValue: numberOfPlaces,
                              onChanged: (val) {
                                setState(() {
                                  numberOfPlaces = val!;
                                });
                              },
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
              Divider(thickness: 2, color: Colors.black12),
              Column(
                children: [
                  Text("Options du véhicule"),
                  choose_car.VehicleOptions(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
