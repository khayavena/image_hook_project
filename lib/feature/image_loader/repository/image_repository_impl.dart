import 'dart:developer';
import 'dart:typed_data';

import 'package:image_hook_project/feature/image_loader/repository/image_repository.dart';

import '../data_source/image_data_source.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource dataSource;

  ImageRepositoryImpl({required this.dataSource});

  @override
  Future<Uint8List?> getImage() async {
    try {
      final image = await dataSource.getImage();
      return image;
    } catch (e, s) {
      log(s.toString());
    }
    return null;
  }

  @override
  Future<bool> deleteImage() async {
    try {
      final image = await dataSource.deleteImage();
      return image;
    } catch (e, s) {
      log(s.toString());
    }
    return false;
  }
}
