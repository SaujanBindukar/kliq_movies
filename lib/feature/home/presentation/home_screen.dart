import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';
import 'package:kliq_movies/feature/home/presentation/news_list_tile.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newsData = ref.watch(homeControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const _NewsHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      newsData.maybeMap(
                        initial: (_) => const CircularProgressIndicator(),
                        loading: (_) => const CircularProgressIndicator(),
                        error: (failure) {
                          return Center(child: Text(failure.failure.reason));
                        },
                        success: (data) {
                          final news = data.data as NewsResponse;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: news.results.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final newsData = news.results[index];
                              return NewsListTile(newsData: newsData);
                            },
                          );
                        },
                        orElse: () => const CircularProgressIndicator(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsHeader extends StatelessWidget {
  const _NewsHeader();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'News',
          style: textStyle.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list_sharp),
        )
      ],
    );
  }
}
