import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Search.dart';
import '../../Models/todoModel.dart';
import '../../Provider/ToDoProvider.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<todoP>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          String title = '';
          showDialog(context: context
              , builder: (context)=>AlertDialog(
                title: Text("Add ToDo"),
                content: TextField(
                    onChanged: (value){
                      title = value;
                    },
                    decoration:
                    InputDecoration(labelText: 'Title',
                        border: OutlineInputBorder())
                ),
                actions: [
                  ElevatedButton(onPressed: (){
                    provider.addToDo(todo(title: title));
                    Navigator.pop(context);
                  },
                      child: Text("Add")),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel"))
                ],) );
        }
            ,child: Icon(Icons.add)),
        appBar : AppBar(title: Text("Your ToDo List",
            style: TextStyle(fontWeight: FontWeight.bold
                ,fontSize: 35)),
            actions: [IconButton(onPressed: (){
              showSearch(context: context, delegate: TSearchDelegate());

            }, icon: Icon(Icons.search)
            )
            ]),
        body : Consumer<todoP>(builder: (context, provider, child) {
          return ListView.builder(
              itemCount: provider.todos.length,
              itemBuilder: (context, index) {
                return Dismissible(key: ValueKey(provider.todos[index])
                    ,onDismissed: (direction){
                      provider.deleteToDo(index);
                    },
                    child :ListTile(
                      onTap: () {
                        String? NewTitle = provider.todos[index].title;
                        showDialog(context: context,
                            builder: (context) =>
                                AlertDialog(
                                  title: Text("Edit ToDo"),
                                  content: TextField(
                                    controller: TextEditingController(
                                        text: provider.todos[index].title),
                                    onChanged: (value) {
                                      NewTitle = value;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Title"),
                                  ),
                                  actions: [
                                    ElevatedButton(onPressed: () {
                                      provider.editToDo(index, todo(title: NewTitle!));
                                      Navigator.pop(context);
                                    },
                                        child: Text("Save")),
                                    ElevatedButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("Cancel"))
                                  ],

                                ));
                      },
                      trailing: Checkbox(value : provider.todos[index].isMarked
                          ,onChanged: (value){
                            provider.toggle(provider.todos[index]);
                          })
                      ,
                      title: Text(provider.todos[index].title
                          ,style: TextStyle(fontSize: 25)),
                    ));
              }
          );

        })




    );}
}


