class Post {
  late String createdAt;
  late String id;
  late String title;
  late String description;
  late String imageUrl;

  Post({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
    );
  }
}
