import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.movie_filter_outlined,
            size: 60,
            color: textColor.secondary,
          ),
          Text(
            "Kliq News",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor.secondary,
                ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
