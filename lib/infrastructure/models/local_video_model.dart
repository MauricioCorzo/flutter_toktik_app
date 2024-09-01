import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  LocalVideoModel.fromJson({required Map<String, dynamic> json})
      : this.name = json["name"] ?? "No video name",
        this.videoUrl = json["videoUrl"], // ?? algun video placeholder
        this.likes = json["likes"] ?? 0,
        this.views = json["views"] ?? 0;

  VideoPost toVideoPostEntity() => VideoPost(
      caption: this.name,
      videoUrl: this.videoUrl,
      likes: this.likes,
      views: this.views);
}
