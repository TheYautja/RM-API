import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "../model/location.dart";

class LocationList extends StatelessWidget {
  Future<List<Location>> pageData() async {
    final response = await http.get(
      Uri.parse(
        "https://rickandmortyapi.com/api/location?page=1",
      ),
    );

    if (response.statusCode == 200) {
      return LocationResponse
          .fromJson(json.decode(response.body))
          .result;
    } else {
      throw Exception("Falha no GET");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Locais"),
      ),
      body: FutureBuilder(
        future: pageData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return AlertDialog(
                title: Text("Sem internet D:"),
              );

            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.done:
              if (!snapshot.hasData) {
                return Text("Sem dados");
              } else {
                List<Location> listaLocais =
                    snapshot.data as List<Location>;

                return ListView.builder(
                  itemCount: listaLocais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.send_to_mobile),
                      ),
                      title: Text(
                        listaLocais[index].name,
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.public,
                            size: 12.0,
                          ),
                          Text(
                            " ${listaLocais[index].type}",
                          ),
                          Text(
                            " • ${listaLocais[index].dimension}",
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}
