

import 'package:flutter/widgets.dart';

class Info
{
    int count;
    int pages;
    String? next;
    String? prev;

    Info
    ({
        required this.count,
        required this.pages,
        this. next,
        this.prev,
    });


    factory Info.fromJson(Map<String, dynamic> json)
    {
        return Info
        (
            count: json['count'],
            pages: json['pages'],
            next: json['next'],
            prev: json['prev'],
        );
    }

}


class CharacterResponse
{
    Info info;
    List<Character> result;

    CharacterResponse
    ({
        required this.info,
        required this.result,
    });

    factory CharacterResponse.fromJson(Map<String, dynamic> json)
    {
        return CharacterResponse
        (
            info: Info.fromJson(json['info']),
            result: List<Character>.from(
                json['results'].map((x) => Character.fromJson(x)),
            ),
        );
    }

}


class Character 
{
    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    Map? origin;
    Map? location;
    String image;
    List? episode;
    String url;
    String created;

    Character
    ({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        this.origin,
        this.location,
        required this.image,
        this.episode,
        required this.url,
        required this.created,
    });
    
    
    factory Character.fromJson(Map<String, dynamic> json)
    {
        return Character
            (
                id: json['id'],
                name: json['name'],
                status: json['status'],
                species: json['species'],
                type: json['type'],
                gender: json['gender'],
                image: json['image'],
                url: json['url'],
                created: json['created'],
            );
    }

}
