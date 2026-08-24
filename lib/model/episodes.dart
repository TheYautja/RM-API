
import 'package:rmapi/model/character.dart';

class Episodes 
{
    int id;
    String name;
    String air_date;
    String episode;
    List<Character>? characters;
    String url;
    String created;

    
    Episodes
    ({
        required this.id,
        required this.name,
        required this.air_date,
        required this.episode,
        required this.url,
        required this.created,
    });


    factory Episodes.fromJson(Map<String, dynamic> json)
    {
        return Episodes
        (
            id: json['id'],
            name: json['name'],
            air_date: json['air_date'],
            episode: json['episode'],
            url: json['url'],
            created: json['created'],
        );
    }


}

class EpisodesResponse
{
    List<Episodes> results;

    EpisodesResponse
    ({
        required this.results,
    });

    factory EpisodesResponse.fromJson(Map<String, dynamic> json)
    {
        return EpisodesResponse
        (
           results: List<Episodes>.from
           (
            json['results'].map
            (
               (x) => Episodes.fromJson(x),
            )
           )
        );
    }
}
