import 'package:flutter/material.dart';

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
            onPressed: () {},
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
