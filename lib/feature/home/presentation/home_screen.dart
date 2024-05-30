import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';

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
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: const Offset(
                                              -2,
                                              2,
                                            ),
                                          )
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: newsData.imageUrl ?? '',
                                              height: 200,
                                              fit: BoxFit.cover,
                                              errorWidget: (context, _, __) {
                                                return const Icon(Icons.error);
                                              },
                                              progressIndicatorBuilder:
                                                  (context, url, progress) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  newsData.title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                if (newsData.description !=
                                                    null)
                                                  Text(
                                                    newsData.description!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.copyWith(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                Text(
                                                  'Published On: ${newsData.pubDate}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      right: 10,
                                      child: InkWell(
                                        onTap: () {},
                                        child: const CircleAvatar(
                                          child: Icon(
                                            Icons.favorite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
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
