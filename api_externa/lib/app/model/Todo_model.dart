class TodoModel {
  final int id;
  final int albumId;
  final String title;
  final String thumbnailUrl;
  final String url;

  TodoModel( {this.url,this.id, this.albumId, this.title, this.thumbnailUrl});

   factory TodoModel.fromJson(Map json){
     return TodoModel(
       id: json['id'],
       albumId: json['userId'],
       url: json['url'],
       thumbnailUrl: json['thumbnailUrl'],
       title: json['title'],
     );

     
     }
     Map toJson(){
       return {
         'id': id,
         'albumId': albumId,
         'title': title,
         'thumbnailUrl': thumbnailUrl,
         'url': url,

       };
     

  }
  

}