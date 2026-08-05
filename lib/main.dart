import 'package:flutter/material.dart';

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
                    CircleAvatar(child: Image.asset("assets/images/characters.png"), radius: 80),
                    Center( child: Text("personagens", style: TextStyle(fontSize: 20)),),
                    CircleAvatar(child: Image.asset("assets/images/locations.png"), radius: 80),
                    Center( child: Text("lugares", style: TextStyle(fontSize: 20)),),
                    CircleAvatar(child: Image.asset("assets/images/episodes.png"), radius: 80),
                    Center( child: Text("episodios", style: TextStyle(fontSize: 20)),),

                ]
            ),


        );
     } 
}
