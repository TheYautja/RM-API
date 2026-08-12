import 'package:flutter/material.dart';
import "screens/characterlist.dart";

void main() {
  runApp(
    MaterialApp(
      home: LandingScreen(),
    )
  );
}



class LandingScreen extends StatelessWidget 
{
   @override
     Widget build(BuildContext context)
     {
        return Scaffold(
            
            appBar: AppBar(
                title: Text("appbar máxima"),
            ),

            body: ListView(
                children: [
                    ButtonImage(imgPath: "assets/images/characters.png", btnText: "personagens"),
                    ButtonImage(imgPath: "assets/images/locations.png", btnText: "locais"),
                    ButtonImage(imgPath: "assets/images/episodes.png", btnText: "episodios"),
                ]
            ),


        );
     } 
}




class ButtonImage extends StatelessWidget
{

    String imgPath;
    String btnText;

    ButtonImage
    ({
        required this.imgPath,
        required this.btnText,
    });

    @override
      Widget build(BuildContext context) {
        return Column(
            children: [

                GestureDetector(
                    onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CharacterList()),
                        );
                    }, 
                    child: CircleAvatar(
                        child: Image.asset(imgPath),
                        radius: 80)),

                Center( 
                    child: Text(btnText, style: TextStyle(fontSize: 20)),
                ),

            ],
        );
      }
}
