import 'package:final_project/constants/gaps.dart';
import 'package:final_project/constants/sizes.dart';
import 'package:final_project/features/moods/widgets/mood_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PublicMoodScreen extends ConsumerStatefulWidget {
  const PublicMoodScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PublicMoodScreenState();
}

class _PublicMoodScreenState extends ConsumerState<PublicMoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Public moods"),
      ),
      body: ListView(
        children: const [
          MoodTile(
            mood: "😁",
            text:
                "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong, Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
            time: "13 min ago",
            likes: '13',
          ),
          MoodTile(
            mood: "😁",
            text:
                "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
            time: "13 min ago",
            likes: '13',
          ),
          MoodTile(
            mood: "😁",
            text:
                "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
            time: "13 min ago",
            likes: '13',
          ),
        ],
      ),
    );
  }
}
