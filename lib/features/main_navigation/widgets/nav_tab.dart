import 'package:final_project/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends ConsumerWidget {
  final IconData icon;
  final double iconSize;
  final Function onTap;
  const NavTab({
    required this.onTap,
    required this.icon,
    required this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}
