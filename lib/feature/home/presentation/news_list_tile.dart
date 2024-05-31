import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/feature/auth/application/app_controller.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';

class NewsListTile extends HookConsumerWidget {
  const NewsListTile({
    super.key,
    required this.newsData,
  });

  final News newsData;

  @override
  Widget build(BuildContext context, ref) {
    final currentUser = ref.watch(appControllerProvider).asData?.value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
                  offset: const Offset(-2, 2),
                )
              ],
              // color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
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
                    progressIndicatorBuilder: (context, url, progress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsData.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (newsData.description != null)
                        Text(
                          newsData.description!,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Published On: ${newsData.pubDate}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
              onTap: () {
                if (currentUser is BaseSuccess) {
                  ref.read(homeControllerProvider.notifier).favouriteNews(
                        news: newsData,
                      );
                } else {
                  //no login, Navigate to login screen
                  context.router.push(const LoginRoute());
                }
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.favorite,
                  color: newsData.isFavourite ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
