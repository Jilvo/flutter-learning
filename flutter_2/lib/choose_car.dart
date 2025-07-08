import 'package:flutter/material.dart';
import 'models/car.dart';

class ChooseCarPage extends StatefulWidget {
  const ChooseCarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ChooseCarState createState() => _ChooseCarState();
}

class _ChooseCarState extends State<ChooseCarPage> {
  int _counter = 0;
  bool _isElectric = true;
  int _numberOfPlaces = 2;
  final Map<String, bool> _options = {
    "GPS": false,
    "Caméra de recul": false,
    "Clim par zone": false,
    "Régulateur de vitesse": false,
    "Toit ouvrant": false,
    "Siège chauffant": false,
    "Roue de secours": false,
    "Jantes alu": false,
  };
  final List<int> seatOptions = [2, 4, 5, 7];

  final List<Car> _cars = [
    Car(name: "MG Cyberster", asset: "assets/images/MG.jpg", places: 2, isElectric: true),
    Car(name: "R5 Électrique", asset: "assets/images/R5.jpg", places: 4, isElectric: true),
    Car(name: "Tesla Model 3", asset: "assets/images/tesla.jpg", places: 5, isElectric: true),
    Car(name: "Van VW", asset: "assets/images/van_vw.jpg", places: 7, isElectric: true),
    Car(name: "Alpine", asset: "assets/images/alpine.jpeg", places: 2, isElectric: false),
    Car(name: "Fiat 500", asset: "assets/images/fiat500.jpg", places: 4, isElectric: false),
    Car(name: "Peugeot 3008", asset: "assets/images/peugeot_3008.jpg", places: 5, isElectric: false),
    Car(name: "Dacia Jogger", asset: "assets/images/dacia_jogger.jpg", places: 7, isElectric: false),
  ];

  Car? _selectedCar;
  String _extraText = "Voici la voiture faite pour vous";

  void _validateParametersOfCar() {
    setState(() {

      if (_isElectric && _counter > 15000) {
        _extraText = "Vous devriez penser à un moteur thermique compte tenu du nombre de kilomètres";
      } else if (!_isElectric && _counter < 5000) {
        _extraText = "Vous faites peu de kilomètres, pensez à regarder les voitures électriques";
      } else {
        _extraText = "Voici la voiture faite pour vous";
      }
      _selectedCar = _cars.firstWhere((c) => c.isElectric == _isElectric && c.places == _numberOfPlaces);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          FilledButton(
            onPressed: _validateParametersOfCar,
            child: const Text("Valider"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Bienvenue !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),

            if (_selectedCar != null)
              Card(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      _extraText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(_selectedCar!.asset, height: 150),
                    const SizedBox(height: 10),
                    Text(
                      "Marque : ${_selectedCar!.name}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

            const SizedBox(height: 20),
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
            const Divider(),

            // Kilometers slider
            Text('Nombre de kilomètres annuel : $_counter'),
            Slider(
              value: _counter.toDouble(),
              min: 0,
              max: 30000,
              divisions: 500,
              label: '$_counter',
              onChanged: (v) => setState(() => _counter = v.toInt()),
            ),
            const Divider(),

            // Motor type switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Moteur électrique"),
                Switch(
                  value: _isElectric,
                  onChanged: (v) => setState(() => _isElectric = v),
                ),
              ],
            ),
            const Divider(),

            // Number of places
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nombre de places : $_numberOfPlaces"),
                Row(
                  children: [
                    for (var seats in seatOptions)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<int>(
                            value: seats,
                            groupValue: _numberOfPlaces,
                            onChanged: (val) => setState(() => _numberOfPlaces = val!),
                          ),
                          Text('$seats'),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            const Divider(),

            // Vehicle options
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Options du véhicule", style: TextStyle(fontSize: 16)),
            ),
            Card(
              child: Column(
                children: _options.entries.map((e) {
                  return CheckboxListTile(
                    title: Text(e.key),
                    value: e.value,
                    onChanged: (v) => setState(() => _options[e.key] = v!),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
