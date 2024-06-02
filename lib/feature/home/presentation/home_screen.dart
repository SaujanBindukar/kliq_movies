import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/application/news_filter_controller.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_category.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_header.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_list_tile.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
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
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: () async {
                  ref.read(newsFilterController.notifier).resetvalue();
                  await ref.read(homeControllerProvider.notifier).getNews();
                  await Future.delayed(
                    const Duration(seconds: 1),
                    _refreshController.refreshCompleted,
                  );
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
