class PostsModel {
  List<Posts>? posts;
  int? total;
  int? skip;
  int? limit;

  PostsModel({posts, total, skip, limit});

  PostsModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? body;
  List<String>? tags;
  Reactions? reactions;
  int? views;
  int? userId;

  Posts({id, title, body, tags, reactions, views, userId});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'] != null
        ? Reactions.fromJson(json['reactions'])
        : null;
    views = json['views'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['tags'] = tags;
    if (reactions != null) {
      data['reactions'] = reactions!.toJson();
    }
    data['views'] = views;
    data['userId'] = userId;
    return data;
  }
}

class Reactions {
  int? likes;
  int? dislikes;

  Reactions({likes, dislikes});

  Reactions.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['likes'] = likes;
    data['dislikes'] = dislikes;
    return data;
  }
}
