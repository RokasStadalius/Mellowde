import 'package:flutter/material.dart';
import 'package:mellowde/main_screen_ui.dart';
import 'package:mellowde/models/genre.dart';

class GenreSelectionScreen extends StatefulWidget {
  const GenreSelectionScreen({super.key});

  @override
  State<GenreSelectionScreen> createState() => _GenreSelectionScreenState();
}

class _GenreSelectionScreenState extends State<GenreSelectionScreen> {
  final genreList = [
    Genre("Pop"),
    Genre("Rock"),
    Genre("Alt"),
    Genre("Blues"),
    Genre("Jazz"),
    Genre("Punk"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "What music do you \nlisten to?",
          style:
              TextStyle(color: Colors.black, fontFamily: "Karla", fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildRows(),
        ),
      ),
    );
  }

  List<Widget> _buildRows() {
    List<Widget> rows = [];
    double spaceBetweenTiles = 20; // Define the space between tiles

    for (int i = 0; i < genreList.length; i += 2) {
      List<Widget> rowChildren = [];
      for (int j = i; j < i + 2 && j < genreList.length; j++) {
        rowChildren.add(
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 30),
                width: 180,
                child: CheckboxListTile(
                  tileColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: Text(
                    genreList[j].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Karla",
                    ),
                  ),
                  value: genreList[j].value,
                  onChanged: (bool? value) {
                    setState(() {
                      genreList[j].value = value ?? false;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20), // Adjust the height as needed
            ],
          ),
        );
        // Add space between tiles
        if (j < i + 1 && j < genreList.length - 1) {
          rowChildren.add(SizedBox(width: spaceBetweenTiles));
        }
      }
      rows.add(Row(
        children: rowChildren,
      ));
    }
    rows.add(const SizedBox(
      height: 40,
    ));
    rows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text(
              'Save',
              style: TextStyle(fontFamily: "Karla"),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: const Color.fromRGBO(150, 84, 132, 100),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(fontFamily: "Karla"),
            ),
          ),
        ),
      ],
    ));
    return rows;
  }
}
