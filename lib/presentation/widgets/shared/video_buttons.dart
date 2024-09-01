import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_numbers_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const VideoButtons({
    super.key,
    required this.videoPost,
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
        _CustomIconButton(
          value: videoPost.likes,
          iconData: Icons.remove_red_eye_outlined,
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
        Text(HumanNumbersFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
