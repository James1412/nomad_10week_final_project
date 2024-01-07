import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/features/write_mood/models/mood_tile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodTileRepository {
  // Current user logged in
  User? user = FirebaseAuth.instance.currentUser;

  // Get collections of moods from firebase
  final CollectionReference moods =
      FirebaseFirestore.instance.collection('moods');

  // Post a mood
  Future<void> addMood(MoodTileModel mood) {
    return moods.add({
      "text": mood.text,
      "emoji": mood.emoji,
      "scale": mood.scale,
      "time": mood.time,
      "creatorUid": mood.creatorUid,
      "likes": mood.likes,
    });
  }

  Stream<QuerySnapshot> getMoodsStream() {
    final moodsStream = FirebaseFirestore.instance
        .collection('moods')
        .orderBy('time', descending: true)
        .snapshots();
    return moodsStream;
  }
}

final moodTileRepo = Provider((ref) => MoodTileRepository());
