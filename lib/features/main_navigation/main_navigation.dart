import 'package:final_project/constants/sizes.dart';
import 'package:final_project/features/moods/private_mood_screen.dart';
import 'package:final_project/features/moods/public_mood_screen.dart';
import 'package:final_project/features/main_navigation/widgets/nav_tab.dart';
import 'package:final_project/features/moods/view_models/auto_scroll_up_vm.dart';
import 'package:final_project/features/write_mood/mood_writing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({required this.tab, super.key});
  final String tab;

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

  Future<void> onTap(int index) async {
    context.go("/${_tabs[index]}");
    if (index == 0 && _selectedIndex == 0) {
      //scroll up
      await ref.read(scrollControllerNotifierProvider).autoScrollUp();
    }
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
        height: Sizes.size52,
        elevation: 5,
        surfaceTintColor: Colors.black,
        padding: const EdgeInsets.only(
          top: Sizes.size20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: NavTab(
                isWrite: false,
                icon: FontAwesomeIcons.house,
                onTap: () => onTap(0),
                isSelected: _selectedIndex == 0,
              ),
            ),
            Expanded(
              child: NavTab(
                isWrite: true,
                icon: FontAwesomeIcons.pencil,
                onTap: () => onTap(1),
                isSelected: _selectedIndex == 1,
              ),
            ),
            Expanded(
              child: NavTab(
                isWrite: false,
                icon: FontAwesomeIcons.solidUser,
                onTap: () => onTap(2),
                isSelected: _selectedIndex == 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
