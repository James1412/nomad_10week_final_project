import 'package:cloud_firestore/cloud_firestore.dart';
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

              if (snapshot.data == null || moods.isEmpty) {
                return const Center(
                  child: Text("No posts... Post something!"),
                );
              }

              // otherwise
              return ListView.builder(
                controller: widget.scrollController,
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
              );
            }),
      ),
    );
  }
}
