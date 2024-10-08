import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
// import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(), // rebote al scroll
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //VideoPlayer + Gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                videoPost: videoPost,
              ),
            ),
            // Botones
          ],
        );
      },
    );
  }
}
