import 'package:flutter/material.dart';

void main() {
  runApp(const BurgerQueenApp());
}

class BurgerQueenApp extends StatelessWidget {
  const BurgerQueenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burger Queen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: const HomeScreen(title: 'Burger Queen'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.restaurant_menu),
        actions: const [Icon(Icons.account_circle)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Section restaurant le plus proche
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 150,
              child: Center(
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const Text(
                              "Mon restaurant le plus proche",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              "4 kms",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.pink,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.touch_app, color: Colors.white),
                              SizedBox(width: 16),
                              Text(
                                "Commander",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Section en ce moment
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle(title: "En ce moment", icon: Icons.fastfood),
                const SizedBox(height: 8),
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior:
                      Clip.antiAlias, // coupe les bords de tout ce qui déborde (≃ ClipRRect)
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/layer-burger.jpg",
                        fit: BoxFit.cover,
                        height: 600,
                        width: double.infinity,
                      ),
                      const Positioned(
                        top: 12,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            "Une petite faim ?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(blurRadius: 4, color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Center(
                            child: Text(
                              "Venez personnaliser votre Burger !",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Section Chaud devant
            Column(
              children: [
                sectionTitle(
                  title: "Chaud Devant",
                  icon: Icons.local_fire_department,
                ),
                Text("Le meilleur de nos burgers à portée de clic"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChaudDevantSectionCard(
                        title: "Burger Classique",
                        description:
                            "Un burger classique avec de la viande, du fromage et des légumes",
                        image_path: "assets/images/twins.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Burger Végétarien",
                        description:
                            "Un burger savoureux sans viande, avec des légumes frais et une galette végétale",
                        image_path: "assets/images/big-queen.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Burger Gourmet",
                        description:
                            "Un burger haut de gamme avec des ingrédients raffinés et une sauce spéciale",
                        image_path: "assets/images/cheese.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle({required String title, required IconData icon}) {
    return Column(
      children: [
        Divider(color: Colors.brown.shade300, indent: 24, endIndent: 24),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Icon(icon, color: Colors.brown.shade300),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(icon, color: Colors.brown.shade300),
            ],
          ),
        ),
        Divider(color: Colors.brown.shade300, indent: 24, endIndent: 24),
      ],
    );
  }

  Widget ChaudDevantSectionCard({
    required String title,
    required String description,
    required String image_path,
    Color color = Colors.white,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 300, // ou autre
        width: 300,
        child: Column(
          children: [
            SizedBox(
              width: 300, // ou une valeur fixe
              height: 200, // ou une valeur fixe
              child: Image.asset(
                image_path,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: color,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.brown.shade300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
