import 'package:cloud_firestore/cloud_firestore.dart';

class MoodTileModel {
  final String text;
  final String emoji;
  final double scale;
  final Timestamp time;
  final String creatorUid;
  final List likes;
  final bool isPublic;

  MoodTileModel({
    required this.isPublic,
    required this.creatorUid,
    required this.text,
    required this.emoji,
    required this.scale,
    required this.time,
    required this.likes,
  });
}
