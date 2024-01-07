import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/constants/gaps.dart';
import 'package:final_project/constants/sizes.dart';
import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:final_project/features/moods/widgets/private_mood_tile.dart';
import 'package:final_project/features/setting/settings_screen.dart';
import 'package:final_project/features/write_mood/repos/mood_tile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PrivateMoodScreen extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const PrivateMoodScreen({required this.scrollController, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrivateMoodState();
}

class _PrivateMoodState extends ConsumerState<PrivateMoodScreen> {
  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My moods"),
        actions: [
          IconButton(
            onPressed: () {
              context.push(SettingsScreen.routeUrl);
            },
            icon: const Icon(
              FontAwesomeIcons.bars,
            ),
          ),
        ],
      ),
      body: Scrollbar(
        controller: widget.scrollController,
        child: StreamBuilder(
            stream: MoodTileRepository().getMoodsStream(),
            builder: (context, snapshot) {
              // when waiting for response
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // when data is empty
              final moods = snapshot.data!.docs;
              // Only have moods written by the user
              for (var mood in moods.toList()) {
                if (ref.watch(authRepo).user != null) {
                  if (mood['creatorUid'] != ref.watch(authRepo).user!.uid) {
                    moods.remove(mood);
                  }
                }
              }
              // Count likes
              int totalLikes = 0;
              for (var mood in moods.toList()) {
                List likes = mood['likes'];
                totalLikes += likes.length;
              }

              if (snapshot.data == null || moods.isEmpty) {
                return const Center(
                  child: Text("No posts... Post something!"),
                );
              }

              // otherwise
              return ListView(
                controller: widget.scrollController,
                children: [
                  Column(
                    children: [
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Total moods",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Text(
                                moods.length.toString(),
                                style: const TextStyle(
                                  fontSize: Sizes.size20,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Total likes",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Text(
                                totalLikes.toString(),
                                style: const TextStyle(
                                  fontSize: Sizes.size20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gaps.v10,
                      const Divider(
                        thickness: 0.5,
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: moods.length,
                    itemBuilder: (context, index) {
                      // get individual post
                      final mood = moods[index];

                      // get data from each post
                      String text = mood['text'];
                      String emoji = mood['emoji'];
                      double scale = mood['scale'];
                      Timestamp time = mood['time'];
                      List likes = mood['likes'];
                      bool isPublic = mood['isPublic'];

                      // return tile
                      return PrivateMoodTile(
                        likes: likes,
                        moodId: mood.id,
                        mood: emoji,
                        text: text,
                        time: time,
                        scale: scale,
                        isPublic: isPublic,
                      );
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
