import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_hook_project/feature/image_loader/data_source/image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  final String url;
  @visibleForTesting
  final DefaultCacheManager cacheManager;

  ImageDataSourceImpl({required this.url, required this.cacheManager});

  @override
  Future<Uint8List> getImage() async {
    final response = await cacheManager.getSingleFile(url);
    return response.readAsBytesSync();
  }

  @override
  Future<bool> deleteImage() async {
    return cacheManager.removeFile(url).then((value) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }
}
