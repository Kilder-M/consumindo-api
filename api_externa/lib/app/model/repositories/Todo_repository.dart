import 'package:dio/dio.dart';

import '../Todo_model.dart';

class TodoRepository {

Dio dio ;
final url = 'https://jsonplaceholder.typicode.com/todos/';

TodoRepository([Dio cliente]) : dio = cliente ?? Dio();

Future <List<TodoModel>> fetch () async {
  final response = await dio.get(url);
  final list = response.data as List;
  return list.map((json) => TodoModel.fromJson(json)).toList();

}

}