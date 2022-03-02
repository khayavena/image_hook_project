import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_hook_project/feature/image_loader/view_model/image_state.dart';
import 'package:image_hook_project/service_locator.dart';

import '../repository/image_repository.dart';
import '../view_model/image_view_model.dart';

class ImageHookPage extends HookConsumerWidget {
  final imageProvider = FutureProvider<ImageState>((ref) async {
    return await ImageViewModel(
            imageRepository: serviceLocator<ImageRepository>())
        .getCurrentState();
  });
  final imageProvider2 = FutureProvider<ImageState>((ref) async {
    return ImageViewModel(imageRepository: serviceLocator<ImageRepository>())
        .getState();
  });

  ImageHookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(imageProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Hook Learning'),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.white,
              onPressed: () {
                ref.refresh(imageProvider2);
              },
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              color: Colors.white,
              onPressed: () {
                ref.refresh(imageProvider);
              },
            )
          ],
        ),
        body: Center(
          child: ref
              .watch(
                imageProvider,
              )
              .when(
                loading: () => const CircularProgressIndicator(),
                error: (err, stack) => Text('Error: $err'),
                data: (imageState) {
                  final data = imageState.byteData;
                  return Container(
                      child: data != null
                          ? Image.memory(data)
                          : Center(child: Text(imageState.message)));
                },
              ),
        ));
  }
}
