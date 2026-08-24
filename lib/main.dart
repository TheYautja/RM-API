import "package:flutter/material.dart";
import "screens/characterlist.dart";
import "screens/LocationList.dart";
import "screens/EpisodesList.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    ),
  );
}

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty"),
      ),

      body: ListView(
        children: [
          ButtonImage(
            imgPath: "assets/images/characters.png",
            btnText: "Personagens",
            destination: CharacterList(),
          ),

          ButtonImage(
            imgPath: "assets/images/locations.png",
            btnText: "Locais",
            destination: LocationList(),
          ),

          ButtonImage(
            imgPath: "assets/images/episodes.png",
            btnText: "Episódios",
            destination: EpisodesList(),
          ),
        ],
      ),
    );
  }
}

class ButtonImage extends StatelessWidget {
  final String imgPath;
  final String btnText;
  final Widget? destination;

  ButtonImage({
    required this.imgPath,
    required this.btnText,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (destination != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => destination!,
                ),
              );
            }
          },

          child: CircleAvatar(
            radius: 80,
            child: Image.asset(imgPath),
          ),
        ),

        Center(
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}
