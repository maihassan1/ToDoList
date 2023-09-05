import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/todoModel.dart';
import '../Provider/ToDoProvider.dart';
class TSearchDelegate extends SearchDelegate{
  Widget buildSearchBar(BuildContext context){
    return TextField(
      onChanged: (query){},
      decoration: InputDecoration(labelText: 'Search'
      ,border: OutlineInputBorder(),
      ),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
  return [
    IconButton(onPressed: (){query = '';}, icon: Icon(Icons.clear))
  ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<todo> searchResult = Provider.of<todoP>(context).SearchTodos(query);
    return ListView.builder(
        itemCount:searchResult.length ,
        itemBuilder: (context,index)=> ListTile(
          title: Text(searchResult[index].title),

        )
    );
  }

  
}