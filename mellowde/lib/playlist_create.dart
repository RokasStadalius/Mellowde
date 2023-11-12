import 'package:flutter/material.dart';
import 'package:mellowde/image_container.dart';

class PlaylistCreation extends StatefulWidget {
  const PlaylistCreation({Key? key}) : super(key: key);

  @override
  State<PlaylistCreation> createState() => _PlaylistCreationState();
}

class _PlaylistCreationState extends State<PlaylistCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
          onPressed: () {},
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x00000000),
        toolbarHeight: 100,
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
                width: 300,
                height: 70,
                padding: const EdgeInsets.only(left: 25, right: 20, top: 20),
                margin: const EdgeInsets.symmetric(horizontal: 70),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x7E5496).withOpacity(1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple.withOpacity(0.15),
                      ),
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: "Karla",
                      fontSize: 20,
                      color: Colors.white54,
                    ),
                    hintText: "Name...",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 20, top: 20),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Select Cover',
                    style: TextStyle(fontFamily: "Karla"),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Color(0x7E5496).withOpacity(1),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, top: 150, bottom: 100),
                child: ImageContainer(
                  height: 200,
                  width: 200,
                  imagePath: "",
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 55, right: 45, top: 50),
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(fontFamily: "Karla"),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.deepPurple,
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
