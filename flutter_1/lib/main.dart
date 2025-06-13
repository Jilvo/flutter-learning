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
                        title: "Twins",
                        description: "Le burger des jumeaux qui font la paire",
                        imagePath: "assets/images/twins.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Big Queen",
                        description:
                            "Pour celles qui portent la couronne à la maison",
                        imagePath: "assets/images/big-queen.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Egg Bacon",
                        description: "Le burger des lève tôt",
                        imagePath: "assets/images/egg-bacon-burger.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Prince",
                        description: "Le préféré des futurs rois",
                        imagePath: "assets/images/prince.jpg",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ChaudDevantSectionCard(
                        title: "Cheese",
                        description: "Le classique pour les fans de fromage",
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
    return Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  image: DecorationImage(
                    image: AssetImage('assets/images/fries.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 100,
                height: 100,
              ),
              Text(
                "Frites classique",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  image: DecorationImage(
                    image: AssetImage('assets/images/patate-douce.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 100,
                height: 100,
              ),
              Text(
                "Frites de patate douce",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  image: DecorationImage(
                    image: AssetImage('assets/images/poutine.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 100,
                height: 100,
              ),
              Text(
                "Poutine",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  image: DecorationImage(
                    image: AssetImage('assets/images/potatoes.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 100,
                height: 100,
              ),
              Text(
                "Potatoes",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
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

  Widget ToucheSucreeSection() {
    final List<Map<String, String>> desserts = [
      {'title': 'Glace Oreo', 'image': 'assets/images/oreo-ice.jpg'},
      {'title': 'Brownie', 'image': 'assets/images/brownie.jpg'},
      {'title': 'Donut', 'image': 'assets/images/donut.jpg'},
      {'title': 'Cupcake', 'image': 'assets/images/cupcake.jpg'},
      {'title': 'Crêpe Fraise', 'image': 'assets/images/strawberry-waffle.jpg'},
    ];
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics:
          NeverScrollableScrollPhysics(), // si tu es dans un SingleChildScrollView
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // largeur max par card
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 4, // largeur / hauteur
      ),
      itemCount: desserts.length,
      itemBuilder: (context, index) {
        final item = desserts[index];
        return ToucheSucreeSectionCard(
          title: item['title'] ?? 'Dessert',
          imagePath: item['image'] ?? 'assets/images/default-dessert.jpg',
        );
      },
    );
  }

  Widget ToucheSucreeSectionCard({
    required String title,
    required String imagePath,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        // width: 180,
        // height: 300,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
