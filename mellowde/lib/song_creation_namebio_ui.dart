import 'package:flutter/material.dart';
import 'package:mellowde/song_creation_coverpic_ui.dart';

class SongCreation extends StatefulWidget {
  const SongCreation({Key? key}) : super(key: key);

  @override
  State<SongCreation> createState() => _SongCreationState();
}

class _SongCreationState extends State<SongCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x00000000),
        toolbarHeight: 100,
        title: const Text(
          "Upload a new song",
          style: TextStyle(
            fontFamily: 'Karla',
            fontSize: 23,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/creationBG.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 151),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple.withOpacity(0.15),
                      ),
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: "Karla",
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                    hintText: "Name...",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 100),
                    filled: true,
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple.withOpacity(0.15),
                      ),
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: "Karla",
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                    hintText: "Additional Info...",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SongCreationCoverPic()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontFamily: "Karla"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
