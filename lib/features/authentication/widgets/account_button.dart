import 'package:final_project/constants/sizes.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final bool isTextBlack;
  final String text;
  final Function onTap;

  const AccountButton({
    super.key,
    required this.isTextBlack,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        height: Sizes.size56,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(Sizes.size32),
          color: isTextBlack ? Colors.white : Colors.black,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
              color: isTextBlack ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
