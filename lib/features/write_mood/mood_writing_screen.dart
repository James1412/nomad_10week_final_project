import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodWritingScreen extends ConsumerStatefulWidget {
  const MoodWritingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoodWritingScreenState();
}

class _MoodWritingScreenState extends ConsumerState<MoodWritingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You mood today"),
      ),
      body: const Center(
        child: Text("Write Mood"),
      ),
    );
  }
}
