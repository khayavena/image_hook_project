import 'dart:typed_data';

class ImageState {
  final Status status;
  late final Uint8List? byteData;
  final String message;

  ImageState(
      {this.status = Status.initial,
      this.message = "",
      this.byteData});
}

enum Status { initial, failure, success }
