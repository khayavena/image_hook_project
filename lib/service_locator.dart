import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:image_hook_project/feature/image_loader/repository/image_repository.dart';
import 'package:image_hook_project/feature/image_loader/repository/image_repository_impl.dart';

import 'feature/image_loader/data_source/image_data_source.dart';
import 'feature/image_loader/data_source/image_data_source_impl.dart';

final serviceLocator = GetIt.instance;

void initServices() {
  const url =
      'https://gtcsys.com/wp-content/uploads/2019/06/Fuchsia-OS-Is-REAL-And-Will-Replace-Android.png';
  serviceLocator.registerLazySingleton<ImageDataSource>(
    () => ImageDataSourceImpl(
      cacheManager: DefaultCacheManager(),
      url: url,
    ),
  );
  serviceLocator.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(
      dataSource: serviceLocator<ImageDataSource>(),
    ),
  );
}
