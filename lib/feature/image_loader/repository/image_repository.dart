import 'dart:typed_data';

abstract class ImageRepository {
  Future<Uint8List?> getImage();

  Future<bool> deleteImage();
}
