import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/utils/news_category.dart';
import 'package:kliq_movies/core/utils/news_sentiment.dart';
import 'package:kliq_movies/core/widgets/custom_button.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/application/news_filter_controller.dart';

class NewsFilterSheet extends StatefulHookConsumerWidget {
  const NewsFilterSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewsFilterSheetState();
}

class _NewsFilterSheetState extends ConsumerState<NewsFilterSheet> {
  @override
  Widget build(BuildContext context) {
    final newsFilter = ref.watch(newsFilterController);
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(newsFilterController.notifier).resetvalue();
                    },
                    child: Text(
                      'Reset',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Category'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: NewsCategory.values.map(
                  (e) {
                    return InkWell(
                      onTap: () {
                        ref.read(newsFilterController.notifier).updateCategory(
                              category: e,
                            );
                      },
                      child: Chip(
                        backgroundColor: e.value == newsFilter.category?.value
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        label: Text(
                          e.label,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: e.value == newsFilter.category?.value
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : null,
                              ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  'Sentiments'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Wrap(
                runSpacing: 20,
                spacing: 10,
                children: NewsSentiment.values.map(
                  (e) {
                    return InkWell(
                      onTap: () {
                        ref
                            .read(newsFilterController.notifier)
                            .updateSentiments(sentiment: e);
                      },
                      child: Chip(
                        backgroundColor: e.value == newsFilter.sentiment?.value
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        label: Text(
                          e.label,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: e.value == newsFilter.sentiment?.value
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : null,
                              ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              CustomButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                name: 'Filter',
                onPressed: () {
                  ref.read(homeControllerProvider.notifier).getNews(
                        category: newsFilter.category?.value,
                        sentiment: newsFilter.sentiment?.value,
                      );
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
