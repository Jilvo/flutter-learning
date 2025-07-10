import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mes photos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const HomeScreen(title: 'Mes photos'),
    );
  }
}

// Passe HomeScreen en StatefulWidget pour gérer l’état de la photo
class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _photo;  // stocke la photo prise
  List<File> _images = []; // liste pour stocker les images

  // Ouvre l’appareil photo et met à jour _photo
  Future<void> _takePhoto() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 85,
    );
    if (picked != null) {
      String path = picked.path;
      File? file = File(path);
      setState(() {
        _images.add(file);
      });
    }
  }

  Future<void> _getPhoto() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 85,
    );
    if (picked != null) {
      String path = picked.path;
      File? file = File(path);
      setState(() {
        _images.add(file);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Bouton pour prendre une photo
          IconButton(
            icon: const Icon(FontAwesomeIcons.images),
            onPressed: _getPhoto ,
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.camera),
            onPressed: _takePhoto,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _images.isNotEmpty
            ? Expanded(
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.only(bottom: 16),
                child: Image.file(
                  _images[index],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        )
            : const Center(
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text("Aucune photo pour l'instant"),
            ),
          ),
        ),
      ),
    );
  }
}
