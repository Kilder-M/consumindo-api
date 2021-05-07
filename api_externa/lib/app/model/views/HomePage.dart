import 'package:api_externa/app/controller/Home_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  _start(){
    return Container();
  }

  _loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _sucess(){
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index){
        var todos = controller.todos[index];
        String id = todos.id.toString();
        String title = todos.title;
        return ListTile(
          title: Text('$id - $title'),
        );
      },
    );
  }

  _error(){
    return Center(
      child: ElevatedButton(
        onPressed: () { 
          controller.start();
         },
        child: Text('Tentar Novamente'),
      ),
    );
     
      
  }

  statemanagment(HomeState state){
    switch (state) {
      case HomeState.start:
        return _start();

        case HomeState.sucess:
        return _sucess();

        case HomeState.error:
        return _error();

        case HomeState.loading:
        return _loading();
        
        
      default:
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       actions: [
         IconButton(
            icon: Icon(Icons.refresh_outlined), onPressed: (){
              controller.start();
          },),
       ],
       title: Text('APIT JSON'),
       backgroundColor: Colors.black,


     ),
     body: AnimatedBuilder(
       animation: controller.state,  
       builder: (context, child){
         return statemanagment(controller.state.value);
       }
       
       ),
      
    );
  }
}

