import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_hook_project/feature/image_loader/repository/image_repository.dart';
import 'package:image_hook_project/feature/image_loader/view_model/image_state.dart';

class ImageViewModel extends StateNotifier<ImageState> {
  @visibleForTesting
  ImageRepository imageRepository;

  ImageViewModel({required this.imageRepository}) : super(ImageState());

  Future<ImageState> getCurrentState() async {
    final image = await imageRepository.getImage();
    if (image == null) {
      state = ImageState(
          status: Status.failure, byteData: image, message: "Refresh image.");
    } else {
      state = ImageState(status: Status.success, byteData: image);
    }
    return state;
  }

  Future<ImageState> getState() async {
    await imageRepository.deleteImage();
    state.byteData = null;
    return state;
  }
}
