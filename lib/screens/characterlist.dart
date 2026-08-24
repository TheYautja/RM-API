import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "../model/character.dart";
import "dart:convert";

class CharacterList extends StatelessWidget
{

    Future<List<Character>> PageData() async
    {
        final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character?page=1"));

        if(response.statusCode == 200)
        {
           return CharacterResponse.fromJson(json.decode(response.body)).result; 
        } else 
        {
            throw Exception("falha no GET");
        }
    }
    
    @override
      Widget build(BuildContext context) {
        
        return Scaffold
        (
            appBar: AppBar(title: Text("lista maxima")),
            body: FutureBuilder(
                future: PageData(),
                builder: (context, snapshot){
                    switch(snapshot.connectionState){
                        
                        case ConnectionState.none:
                        return AlertDialog(title: Text("sem internet D:"),);

                        case ConnectionState.waiting:
                        case ConnectionState.active:
                        return CircularProgressIndicator();

                        case ConnectionState.done:
                        if(!snapshot.hasData){
                            return Text("sem dados");
                        } else {
                            List<Character> listaPersonagens = snapshot.data as List<Character>;
                             
                            return ListView.builder(itemCount: listaPersonagens.length,  itemBuilder: (context, index){
                                return ListTile(
                                    leading: CircleAvatar(backgroundImage: NetworkImage(listaPersonagens[index].image),),
                                    title: Text(listaPersonagens[index].name),
                                    subtitle: Row(
                                        children: [
                                            Icon(Icons.circle, size: 10.0, color: (
                                                listaPersonagens[index].status == "Alive" ? Colors.green : Colors.red)
                                            ),
                                            Text(
                                                listaPersonagens[index].status == "Alive" ? "Vivo" : "Morto",
                                            ),
                                        ]
                                    ),

                                );
                            });
                        }
                    }
                },
            ),
        );
      }
}
