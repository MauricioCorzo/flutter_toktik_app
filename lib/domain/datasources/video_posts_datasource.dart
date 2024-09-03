import 'package:toktik/domain/entities/video_post.dart' show VideoPost;

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
