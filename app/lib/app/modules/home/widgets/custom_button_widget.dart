import 'package:app/app/shared/themes/app_typography.dart';
import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  final Color color;
  final String text;
  final action;

  const CustomButtomWidget({
    @required this.color,
    @required this.text,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: color,
        elevation: 0,
        child: Text(
          text,
          style: AppTypography.button,
        ),
        onPressed: action,
      ),
    );
  }
}
