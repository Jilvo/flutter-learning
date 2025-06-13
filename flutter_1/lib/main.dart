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
                        imagePath: "assets/images/twins.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Burger Végétarien",
                        description:
                            "Un burger savoureux sans viande, avec des légumes frais et une galette végétale",
                        imagePath: "assets/images/big-queen.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Burger Gourmet",
                        description:
                            "Un burger haut de gamme avec des ingrédients raffinés et une sauce spéciale",
                        imagePath: "assets/images/cheese.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Section Les accompagements
            Column(
              children: [
                sectionTitle(
                  title: "Les accompagnements",
                  icon: Icons.room_service,
                ),
                LesAccompagnementsSection(),
              ],
            ),
            Column(
              children: [
                sectionTitle(
                  title: "Une petite soif ?",
                  icon: Icons.local_drink,
                ),
                UnePetiteSoifSection(
                  bgColor: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
            Column(
              children: [
                sectionTitle(title: "La touche sucrée", icon: Icons.cookie),
                ToucheSucreeSection(),
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
    required String imagePath,
    Color color = Colors.pinkAccent,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 300,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              // Fond rose avec texte
              Container(
                color: color,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.brown.shade300,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget LesAccompagnementsSection() {
    return Text("null");
  }

  Widget ToucheSucreeSection() {
    return Text("null");
  }

  Widget ToucheSucreeSectionCard({
    required String title,
    required String imagePath,
  }) {
    return Text("null");
  }

  Widget UnePetiteSoifSection({Color bgColor = Colors.pink}) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UnePetiteSoifSectionCard(
              title: "Le classique",
              imagePath: "assets/images/classic-cola.jpg",
            ),
            UnePetiteSoifSectionCard(
              title: "Eau gazeuse",
              imagePath: "assets/images/sparkling.jpg",
            ),
            UnePetiteSoifSectionCard(
              title: "A l'orange",
              imagePath: "assets/images/orange-soda.jpg",
            ),
            UnePetiteSoifSectionCard(
              title: "A la Fraise",
              imagePath: "assets/images/strawberry-soda.jpg",
            ),
          ],
        ),
      ),
    );
  }

  Widget UnePetiteSoifSectionCard({
    required String title,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        width: 180,
        height: 400,
        child: Stack(
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, height: 500),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Text(
                  title,

                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontSize: 20,
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
