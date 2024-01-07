import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/features/moods/widgets/public_mood_tile.dart';
import 'package:final_project/features/write_mood/repos/mood_tile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PublicMoodScreen extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const PublicMoodScreen({required this.scrollController, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PublicMoodScreenState();
}

class _PublicMoodScreenState extends ConsumerState<PublicMoodScreen> {
  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Public moods"),
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
            for (var mood in moods.toList()) {
              if (mood['isPublic'] == false) {
                moods.remove(mood);
              }
            }

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

                for (var mood in moods.toList()) {
                  if (mood['isPublic'] == false) {
                    moods.remove(mood);
                  }
                }

                // get data from each post
                String text = mood['text'];
                String emoji = mood['emoji'];
                double scale = mood['scale'];
                Timestamp time = mood['time'];
                List likes = mood['likes'];

                // return tile
                return PublicMoodTile(
                  mood: emoji,
                  text: text,
                  time: time,
                  likes: likes,
                  scale: scale,
                  moodId: mood.id,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
