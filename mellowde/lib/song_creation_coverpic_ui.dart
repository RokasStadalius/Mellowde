import 'package:flutter/material.dart';
import 'package:mellowde/image_container.dart';

class SongCreationCoverPic extends StatefulWidget {
  const SongCreationCoverPic({super.key});

  @override
  State<SongCreationCoverPic> createState() => _SongCreationCoverPicState();
}

class _SongCreationCoverPicState extends State<SongCreationCoverPic> {
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
        title: const Text(
          "Select a cover image",
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
              Padding(
                padding:
                    const EdgeInsets.only(left: 106, top: 250, bottom: 100),
                child: ImageContainer(
                  height: 200,
                  width: 200,
                  imagePath: "",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 103),
                width: 150,
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
