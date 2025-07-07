import 'package:flutter/material.dart';


class ChooseCar extends StatefulWidget {
  const ChooseCar({Key? key}) : super(key: key);

  @override
  _ChooseCarState createState() => _ChooseCarState();
}

class _ChooseCarState extends State<ChooseCar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            "Voici la voiture faite pour vous !",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/MG.jpg"),
          const SizedBox(height: 10),
          Text(
            "Marque : Tesla",
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
    );
  }
}


class VehicleOptions extends StatefulWidget {
  const VehicleOptions({Key? key}) : super(key: key);

  @override
  _VehicleOptionsState createState() => _VehicleOptionsState();
}

class _VehicleOptionsState extends State<VehicleOptions> {
  // La Map vit dans le State, elle ne sera pas recréée à chaque build
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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 10),
          ..._options.entries.map((entry) {
            return CheckboxListTile(
              title: Text(entry.key),
              value: entry.value,
              onChanged: (bool? value) {
                setState(() {
                  _options[entry.key] = value ?? false;
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  void validateParameterOfCar(){
    print(_options);
  }
}
