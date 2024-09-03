import 'package:toktik/domain/datasources/video_posts_datasource.dart'
    show VideoPostDatasource;
import 'package:toktik/domain/entities/video_post.dart' show VideoPost;
import 'package:toktik/infrastructure/models/local_video_model.dart'
    show LocalVideoModel;
import 'package:toktik/shared/data/local_video_post.dart' show videoPostsData;

class LocalVideosDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    // Lo dejamos asi porque ahora no lo usamos
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final newVideos = videoPostsData.map((videoInfo) {
      final videoModel = LocalVideoModel.fromJson(json: videoInfo);

      final videoPostsEntity = videoModel.toVideoPostEntity();

      return videoPostsEntity;
    });

    return newVideos.toList();
  }
}
