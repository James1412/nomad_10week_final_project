import 'package:final_project/constants/gaps.dart';
import 'package:final_project/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoodTile extends ConsumerStatefulWidget {
  final String mood;
  final String text;
  final String time;
  final String likes;
  final String username;
  const MoodTile({
    required this.mood,
    required this.text,
    required this.time,
    required this.likes,
    required this.username,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoodTileState();
}

class _MoodTileState extends ConsumerState<MoodTile> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size10,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.black38,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v10,
          Text(
            "Mood: ${widget.mood}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v5,
          Text(
            widget.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v8,
          Opacity(
            opacity: 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      widget.likes,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.h7,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Icon(
                        isLiked
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        size: Sizes.size18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gaps.v8,
          Text(widget.username),
          Gaps.v10,
        ],
      ),
    );
  }
}
