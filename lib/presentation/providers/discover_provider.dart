import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart' show VideoPost;
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart' show videoPostsData;

class DiscoverProvider extends ChangeNotifier {
  //TODO: Respository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  // or loadNextVideo()
  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final newVideos = videoPostsData.map((videoInfo) {
      final videoModel = LocalVideoModel.fromJson(json: videoInfo);

      final videoPostsEntity = videoModel.toVideoPostEntity();

      return videoPostsEntity;
    });

    // Se puede transforma el newVdieos a List con .toList()
    // pero la funcion .addAll() acepta un <Iterable>
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
