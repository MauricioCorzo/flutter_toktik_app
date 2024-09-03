import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart' show VideoPost;
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostsRepository,
  });

  // or loadNextVideo()
  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final newVideos = videoPostsData.map((videoInfo) {
    //   final videoModel = LocalVideoModel.fromJson(json: videoInfo);

    //   final videoPostsEntity = videoModel.toVideoPostEntity();

    //   return videoPostsEntity;
    // });

    final newVideos = await videoPostsRepository.getTrendingVideosByPage(1);

    // Se puede transforma el newVdieos a List con .toList()
    // pero la funcion .addAll() acepta un <Iterable>
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
