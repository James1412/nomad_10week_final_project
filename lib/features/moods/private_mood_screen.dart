import 'package:final_project/constants/gaps.dart';
import 'package:final_project/constants/sizes.dart';
import 'package:final_project/features/moods/widgets/private_mood_tile.dart';
import 'package:final_project/features/setting/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PrivateMoodScreen extends ConsumerStatefulWidget {
  const PrivateMoodScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrivateMoodState();
}

class _PrivateMoodState extends ConsumerState<PrivateMoodScreen> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Private moods"),
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
      body: RefreshIndicator.adaptive(
        displacement: 10,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Scrollbar(
          controller: _controller,
          child: ListView(
            controller: _controller,
            children: const [
              Column(
                children: [
                  Gaps.v20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total moods",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                              fontSize: Sizes.size20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Total likes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Text(
                            "13",
                            style: TextStyle(
                              fontSize: Sizes.size20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gaps.v10,
                  Divider(
                    thickness: 0.5,
                  ),
                ],
              ),
              PrivateMoodTile(
                mood: "😁",
                text:
                    "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong, Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
                time: "Jan 3",
                likes: '13',
              ),
              PrivateMoodTile(
                mood: "😁",
                text:
                    "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong, Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
                time: "Jan 3",
                likes: '13',
              ),
              PrivateMoodTile(
                mood: "😁",
                text:
                    "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong, Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
                time: "Jan 3",
                likes: '13',
              ),
              PrivateMoodTile(
                mood: "😁",
                text:
                    "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
                time: "Jan 3",
                likes: '13',
              ),
              PrivateMoodTile(
                mood: "😁",
                text:
                    "Hi this is very long test mood sentences. It's to describe my emotion today and what I did today and it is going to be really loooooooooong",
                time: "Jan 3",
                likes: '13',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
