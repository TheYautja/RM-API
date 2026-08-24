import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "../model/character.dart";
import "dart:convert";



class CharacterList extends StatefulWidget
{

    @override
    State<CharacterList> createState() => _CharacterListState();


}



class _CharacterListState extends State<CharacterList>
{

    ScrollController _scrollController = ScrollController();
    final List<Character> personagens = [];
    int pageIndex = 1;
    bool loading = false;
    bool end = false;


    @override
    void initState()
    {
        super.initState();

        _scrollController.addListener
        (
            (){
                final pos = _scrollController.position;
                if(pos.pixels >= pos.maxScrollExtent - 200)
                {
                    loadPage();
                }
            }
        );

        loadPage();
    }


    Future<void> loadPage() async
    {
        if(loading || end) return;

        setState
        (
            (){
                loading = true;
            }
        );

        try
        {
            final newP = await PageData(pageIndex);

            if(!mounted) return;

            setState
            (
                (){
                    personagens.addAll(newP);
                    pageIndex++;
                    loading = false;

                    if(newP.isEmpty || pageIndex > 42)
                    {
                        end = true;
                    }
                }
            );
        }
        catch(e)
        {
            if(!mounted) return;

            setState
            (
                (){
                    loading = false;
                }
            );

            ScaffoldMessenger.of(context).showSnackBar
            (
                SnackBar(content: Text("devagar caralho"))
            );
        }
    }


    Future<List<Character>> PageData(int page) async
    {
        final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character?page=${page}"));

        if(response.statusCode == 200)
        {
           return CharacterResponse.fromJson(json.decode(response.body)).result;
        } else
        {
            throw Exception("falha no GET");
        }
    }


    @override
    void dispose()
    {
        _scrollController.dispose();
        super.dispose();
    }


    @override
    Widget build(BuildContext context) {

        return Scaffold
        (
            appBar: AppBar(title: Text("lista maxima")),
            body: personagens.isEmpty && loading
                ? Center
                (
                    child: CircularProgressIndicator()
                )
                : ListView.builder
                (
                    controller: _scrollController,
                    itemCount: personagens.length + (loading ? 1 : 0),
                    itemBuilder: (context, index){

                        if(index == personagens.length)
                        {
                            return Padding
                            (
                                padding: EdgeInsets.all(16),
                                child: Center
                                (
                                    child: CircularProgressIndicator()
                                ),
                            );
                        }

                        return ListTile(
                            leading: CircleAvatar(backgroundImage: NetworkImage(personagens[index].image),),
                            title: Text(personagens[index].name),
                            subtitle: Row(
                                children: [
                                    Icon(Icons.circle, size: 10.0, color: (
                                        personagens[index].status == "Alive" ? Colors.green : Colors.red)
                                    ),
                                    Text(
                                        personagens[index].status == "Alive" ? "Vivo" : "Morto",
                                    ),
                                ]
                            ),

                        );
                    }
                ),
        );
    }
}

