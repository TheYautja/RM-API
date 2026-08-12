import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "../model/character.dart";
import "dart:convert";

class CharacterList extends StatelessWidget
{

    Future<List<Character>> PageData () async
    {
        final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character?page=1"));

        if(response.statusCode == 200)
        {
           return CharacterResponse.fromJson(json.decode(response.body)); 
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
                future: null,
                builder: null,
            ),
        );
      }
}
