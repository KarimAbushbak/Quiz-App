import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizie/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

class CategoryProgress extends StatelessWidget {
  final String category;
  final Color color;
  const CategoryProgress({required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: AppSettingsSharedPreferences().getAnswered(category),
      builder: (context, snapshot) {
        final answered = snapshot.data ?? 0;
        const total = 30;
        final progress = answered / total;

        return SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 4,
                color: color,
                backgroundColor: color.withOpacity(0.2),
              ),
              Text(
                '$answered/$total',
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
