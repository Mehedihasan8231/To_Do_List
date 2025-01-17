
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/model/TODOModel.dart';
import 'package:to_do_list/provider/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();

  Future<void> _showDialog() async{
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(title: Text("Add Todo List"),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(hintText: 'Write to do item'),
          
        ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancel')),
            TextButton(onPressed: (){

              if(_textController.text.isEmpty){
                return;
              }
              context.read<TodoProvider>().addToDoList(new TODOModel(title: _textController.text, isCompleted: false));
              _textController.clear();

              Navigator.pop(context);
            }, child: Text('Submit'))
          ],
        );
      }
    );
  }




  @override
  Widget build(BuildContext context) {



    final provider = Provider.of<TodoProvider>(context);


    return Scaffold(
      body: SafeArea(child:Column(
        children: [
          Expanded(
              child: Container(
              child:  Center (child: Text('TO DO List',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  wordSpacing:10,
                ),
              )),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))),
          )),
          Expanded(
            flex: 3,
            child: ListView.builder(
    itemBuilder: (context, itemIndex){

      return ListTile(
        onTap:(){provider.todoStatusChange(provider.allTODOList[itemIndex]);},


        title: Text(provider.allTODOList[itemIndex].title,
          style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,
          decoration: provider.allTODOList[itemIndex].isCompleted==true?TextDecoration.lineThrough:null),
        ),


      leading: MSHCheckbox(size: 25,
      value: provider.allTODOList[itemIndex].isCompleted,
      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(checkedColor: Colors.blue),
        style: MSHCheckboxStyle.stroke,
        onChanged: (selected){
        provider.todoStatusChange(provider.allTODOList[itemIndex]);
        },
      ),
      trailing: IconButton(onPressed: (){
        provider.removeToDoList(provider.allTODOList[itemIndex]);

      }, icon: Icon(Icons.delete)),
      );
    },
            itemCount: provider.allTODOList.length,),



          ),
        ],

      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialog();
        },
        child: Icon(Icons.add),),
    );
  }
}
