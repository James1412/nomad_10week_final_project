import 'package:final_project/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavTab extends ConsumerWidget {
  final IconData icon;
  final Function onTap;
  final bool isSelected;
  final bool isWrite;
  const NavTab({
    required this.isWrite,
    required this.isSelected,
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isSelected ? 1 : 0.3,
          child: Icon(
            icon,
            size: Sizes.size24,
          ),
        ),
      ),
    );
  }
}
