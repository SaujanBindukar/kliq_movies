import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/hive/hive_box.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';

final favouriteRepositoryProvider = Provider<IFavouriteRepository>((ref) {
  return FavouriteRepository();
});

abstract class IFavouriteRepository {
  Future<List<News>> getFavouriteNews();
  Future<bool> cacheFavouriteMovies({required List<News> news});
}

class FavouriteRepository implements IFavouriteRepository {
  @override
  Future<bool> cacheFavouriteMovies({required List<News> news}) async {
    try {
      final box = await Hive.openLazyBox(HiveBox.favouriteNewsBox);
      await box.put('news', news);
      await box.close();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<List<News>> getFavouriteNews() async {
    try {
      final box = await Hive.openLazyBox(HiveBox.favouriteNewsBox);
      final data = await box.get('news') as List<dynamic>;
      return List<News>.from(data);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
