import 'package:final_project/constants/gaps.dart';
import 'package:final_project/constants/sizes.dart';
import 'package:final_project/features/write_mood/edit_mood_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PrivateMoodTile extends ConsumerStatefulWidget {
  final String mood;
  final String text;
  final String time;
  final String likes;
  const PrivateMoodTile({
    required this.mood,
    required this.text,
    required this.time,
    required this.likes,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoodTileState();
}

class _MoodTileState extends ConsumerState<PrivateMoodTile> {
  bool isLiked = false;
  bool _expandText = false;
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Row(
                  children: [
                    const Text(
                      "Mood: ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size20,
                      ),
                    ),
                    Text(
                      widget.mood,
                      style: const TextStyle(
                        fontSize: Sizes.size24,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Slider(
                    allowedInteraction: SliderInteraction.tapOnly,
                    value: 0.5,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          Gaps.v5,
          GestureDetector(
            onTap: () {
              setState(() {
                _expandText = !_expandText;
              });
            },
            child: Text(
              widget.text,
              maxLines: _expandText ? null : 2,
              overflow: _expandText ? null : TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
          ),
          Gaps.v20,
          Opacity(
            opacity: 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        widget.likes,
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.h7,
                      Icon(
                        isLiked
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        size: Sizes.size18,
                        color: isLiked ? Colors.pink : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gaps.v10,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.push(EditMoodScreen.routeUrl);
              },
              child: const Text("Edit"),
            ),
          ),
        ],
      ),
    );
  }
}
