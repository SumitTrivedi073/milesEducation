import 'dart:convert';

dataListFromJson(String str) => DataList.fromJson(json.decode(str));

String dataListToJson(DataList data) => json.encode(data.toJson());

class DataList {
  List<Datum> data;

  DataList({
    required this.data,
  });

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String blockType;
  String name;
  String? heading;
  int position;
  int count;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  String vertical;
  dynamic createdBy;
  String? modifiedBy;
  List<Post> posts;

  Datum({
    required this.id,
    required this.blockType,
    required this.name,
    required this.heading,
    required this.position,
    required this.count,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.vertical,
    required this.createdBy,
    required this.modifiedBy,
    required this.posts,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    blockType: json["block_type"],
    name: json["name"],
    heading: json["heading"],
    position: json["position"],
    count: json["count"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    vertical: json["vertical"],
    createdBy: json["created_by"],
    modifiedBy: json["modified_by"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "block_type": blockType,
    "name": name,
    "heading": heading,
    "position": position,
    "count": count,
    "active": active,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "vertical": vertical,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}

class Post {
  String id;
  List<FileElement> files;
  bool likedByMe;
  String title;
  String postType;
  String description;
  String metadata;
  String? fullVideoUrl;
  String? blogUrl;
  bool active;
  bool featured;
  int priority;
  int likes;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String layout;
  dynamic persona;
  String modifiedBy;

  Post({
    required this.id,
    required this.files,
    required this.likedByMe,
    required this.title,
    required this.postType,
    required this.description,
    required this.metadata,
    required this.fullVideoUrl,
    required this.blogUrl,
    required this.active,
    required this.featured,
    required this.priority,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.layout,
    required this.persona,
    required this.modifiedBy,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    files: List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
    likedByMe: json["liked_by_me"],
    title: json["title"],
    postType: json["post_type"],
    description: json["description"],
    metadata: json["metadata"],
    fullVideoUrl: json["full_video_url"],
    blogUrl: json["blog_url"],
    active: json["active"],
    featured: json["featured"],
    priority: json["priority"],
    likes: json["likes"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    layout: json["layout"],
    persona: json["persona"],
    modifiedBy: json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "files": List<dynamic>.from(files.map((x) => x.toJson())),
    "liked_by_me": likedByMe,
    "title": title,
    "post_type": postType,
    "description": description,
    "metadata": metadata,
    "full_video_url": fullVideoUrl,
    "blog_url": blogUrl,
    "active": active,
    "featured": featured,
    "priority": priority,
    "likes": likes,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
    "layout": layout,
    "persona": persona,
    "modified_by": modifiedBy,
  };
}

class FileElement {
  String id;
  String mediaType;
  String? videoUrl;
  String? thumbnail;
  String? imagePath;
  int mediaOrder;
  dynamic ratio;
  bool active;
  String post;

  FileElement({
    required this.id,
    required this.mediaType,
    required this.videoUrl,
    required this.thumbnail,
    required this.imagePath,
    required this.mediaOrder,
    required this.ratio,
    required this.active,
    required this.post,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    id: json["id"],
    mediaType: json["media_type"],
    videoUrl: json["video_url"],
    thumbnail: json["thumbnail"],
    imagePath: json["image_path"],
    mediaOrder: json["media_order"],
    ratio: json["ratio"],
    active: json["active"],
    post: json["post"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": mediaType,
    "video_url": videoUrl,
    "thumbnail": thumbnail,
    "image_path": imagePath,
    "media_order": mediaOrder,
    "ratio": ratio,
    "active": active,
    "post": post,
  };
}


