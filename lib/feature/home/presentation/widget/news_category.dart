import 'package:flutter/material.dart';
import 'package:kliq_movies/core/utils/news_category.dart';

class NewsCategoryWidget extends StatelessWidget {
  const NewsCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: NewsCategory.values.length,
        itemBuilder: (context, index) {
          final data = NewsCategory.values[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 8),
            child: Chip(
              label: Text(data.label),
            ),
          );
        },
      ),
    );
  }
}
