import 'package:api_externa/app/model/Todo_model.dart';
import 'package:api_externa/app/model/repositories/Todo_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {

List<TodoModel> todos ;
final  TodoRepository _repository;
final state = ValueNotifier<HomeState>(HomeState.start);


  HomeController([TodoRepository repository]) : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try{

      todos = await _repository.fetch();
      state.value = HomeState.sucess;

    }catch(e){
      state.value = HomeState.error;
    }


  }



}

enum HomeState{
  start,loading,sucess,error
}