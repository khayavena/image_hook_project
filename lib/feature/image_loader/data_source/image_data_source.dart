import 'dart:io' ;

import 'dart:typed_data';

abstract class ImageDataSource {
  Future<Uint8List> getImage();

  Future<bool> deleteImage();
}
