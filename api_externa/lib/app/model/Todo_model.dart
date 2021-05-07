class TodoModel {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  TodoModel({this.id, this.userId, this.title, this.completed});

   factory TodoModel.fromJson(Map json){
     return TodoModel(
       id: json['id'],
       userId: json['userId'],
       completed: json['completed'],
       title: json['title'],
     );

     
     }
     Map toJson(){
       return {
         'id': id,
         'userId': userId,
         'title': title,
         'completed': completed,

       };
     

  }
  

}