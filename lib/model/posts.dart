


class Posts{

 final String createdAt;
 final String title;
 final String description;
 final String imageUrl;
 final String id;

 Posts({
   required this.imageUrl,
   required this.id,
   required this.description,
   required this.title,
   required this.createdAt
});


  factory Posts.fromJson(Map<String, dynamic> json){
    return Posts(
        imageUrl: json['imageUrl'],
        id: json['id'],
        description: json['description'],
        title: json['title'],
        createdAt: json['createdAt']
    );
  }








}