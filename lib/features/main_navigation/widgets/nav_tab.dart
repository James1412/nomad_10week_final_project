import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavTab extends ConsumerWidget {
  final IconData icon;
  final double iconSize;
  final Function onTap;
  final bool isSelected;
  const NavTab({
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: double.maxFinite,
        color: Colors.transparent,
        child: Icon(
          icon,
          size: iconSize,
          color: isSelected ? Colors.black : Colors.black45,
        ),
      ),
    );
  }
}
