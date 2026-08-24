import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import "package:rmapi/model/episodes.dart";
import "dart:convert";

class EpisodesList extends StatelessWidget
{

    Future<List<Episodes>> PageData() async
    {
        final response = await http.get
        (
            Uri.parse("https://rickandmortyapi.com/api/episode"),
        );

        return EpisodesResponse.fromJson(json.decode(response.body)).results;

    }


    @override
      Widget build(BuildContext context)
      {
        return Scaffold
        (
            appBar: AppBar(title: Text("o bobo do episódio")),

            body: FutureBuilder
            (
                future: PageData(),
                builder: (context, snapshot)
                {
                    if (snapshot.connectionState == ConnectionState.waiting)
                    {
                        return Center(
                            child: CircularProgressIndicator(),
                        );
                    }

                    if (snapshot.hasError)
                    {
                        return Center(
                            child: Text("Erro: ${snapshot.error}"),
                        );
                    }

                    List<Episodes> episodesList = snapshot.data!;

                    return ListView.builder
                    (
                        itemCount: episodesList.length,
                        itemBuilder: (context, index)
                        {
                            return ListTile
                            (
                                leading: CircleAvatar(
                                    child: Icon(Icons.send_to_mobile),
                                ),
                            title: Text(
                                episodesList[index].name,
                            ),
                            subtitle: Row(
                                children: [
                                    Icon(
                                    Icons.public,
                                    size: 12.0,
                                ),
                                Text(" ${episodesList[index].episode}",),
                                Text("${episodesList[index].created}",),
                        ],
                      ),

                            );
                        },
                    );
                },
            )
        );
      }
}