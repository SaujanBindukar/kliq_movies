import 'dart:developer';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:kliq_movies/core/app_setup/hive/hive_adapter.dart';
import 'package:path_provider/path_provider.dart';

/// Setup class for hive
class HiveSetup {
  // Private constructor
  HiveSetup._();

  //initialize hive and its adapter
  static Future<void> initHive() async {
    try {
      final dbPath = await databasePath;
      Hive.init(dbPath);
      HiveAdapter.init();
    } catch (e) {
      log('Hive init exception : $e');
    }
  }
}

const String _dbDirectory = 'KliqHive';

///path of local device
Future<String> get databasePath async {
  final appDir = await getApplicationDocumentsDirectory();
  final databaseDir = Directory('${appDir.path}/$_dbDirectory');
  return databaseDir.path;
}
