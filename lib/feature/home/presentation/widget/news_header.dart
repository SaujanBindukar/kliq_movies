import 'package:flutter/material.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_filter_sheet.dart';

class NewsHeader extends StatelessWidget {
  const NewsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search News',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton.outlined(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (context) {
                  return const NewsFilterSheet();
                },
              );
            },
            icon: const Icon(
              Icons.filter_list,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
