import 'package:final_project/constants/sizes.dart';
import 'package:final_project/features/moods/private_mood_screen.dart';
import 'package:final_project/features/moods/public_mood_screen.dart';
import 'package:final_project/features/main_navigation/widgets/nav_tab.dart';
import 'package:final_project/features/setting/settings_screen.dart';
import 'package:final_project/features/write_mood/mood_writing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({required this.tab, super.key});
  final tab;

  static const routeUrl = '/public';
  static const routeName = 'mainNavigation';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  final List<String> _tabs = [
    "public",
    "write",
    "private",
  ];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const PublicMoodScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const MoodWritingScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const PrivateMoodScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        surfaceTintColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              iconSize: Sizes.size24,
              onTap: () => onTap(0),
            ),
            NavTab(
              icon: FontAwesomeIcons.pencil,
              iconSize: Sizes.size32,
              onTap: () => onTap(1),
            ),
            NavTab(
              icon: FontAwesomeIcons.gear,
              iconSize: Sizes.size24,
              onTap: () => onTap(2),
            ),
          ],
        ),
      ),
    );
  }
}
