import 'package:flutter/material.dart';
import 'package:mellowde/image_container.dart';

class PlaylistEdit extends StatefulWidget {
  const PlaylistEdit({Key? key}) : super(key: key);

  @override
  State<PlaylistEdit> createState() => _PlaylistEditState();
}

class _PlaylistEditState extends State<PlaylistEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x00000000),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/creationBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Container(
                width: 300,
                height: 65,
                padding: const EdgeInsets.only(left: 25, right: 20, top: 15),
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
                padding: const EdgeInsets.only(left: 25, right: 20, top: 10),
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
              Container(
                padding: const EdgeInsets.only(left: 55, right: 45, top: 5),
                width: 220,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Delete',
                    style: TextStyle(fontFamily: "Karla"),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Color(0x96546C).withOpacity(1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






