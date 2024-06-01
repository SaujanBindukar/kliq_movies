import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/presentation/news_list_tile.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_category.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_header.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_loading_widget.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsData = ref.watch(homeControllerProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20 + MediaQuery.of(context).padding.top),
            const NewsHeader(),
            const NewsCategoryWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    newsData.maybeMap(
                      initial: (_) => const CircularProgressIndicator(),
                      loading: (_) => ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const NewsLoadingWidget();
                        },
                      ),
                      error: (failure) {
                        return Center(child: Text(failure.failure.reason));
                      },
                      success: (data) {
                        final news = data.data!;
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          shrinkWrap: true,
                          itemCount: news.results.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final newsData = news.results[index];
                            return NewsListTile(newsData: newsData);
                          },
                        );
                      },
                      orElse: () => const CircularProgressIndicator(),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
