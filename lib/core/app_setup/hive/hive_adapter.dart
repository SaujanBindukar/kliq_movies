import 'package:hive/hive.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';

class HiveAdapter {
  static void init() {
    Hive
      ..registerAdapter(NewsResponseAdapter())
      ..registerAdapter(NewsAdapter());
  }
}
