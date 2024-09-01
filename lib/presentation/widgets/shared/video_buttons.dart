import 'package:animate_do/animate_do.dart' show SpinPerfect;
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_numbers_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  final bool isVideoPlaying;
  const VideoButtons({
    super.key,
    required this.videoPost,
    required this.isVideoPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: videoPost.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        // const SizedBox(height: 0),
        _CustomIconButton(
          value: videoPost.likes,
          iconData: Icons.remove_red_eye_outlined,
        ),
        // const SizedBox(height: 0),
        SpinPerfect(
          infinite: true,
          animate: this.isVideoPlaying,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      : this.color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              this.iconData,
              color: this.color,
              size: 30,
            )),
        // https://dart.dev/language/collections#control-flow-operators
        if (this.value > 0)
          Text(HumanNumbersFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
