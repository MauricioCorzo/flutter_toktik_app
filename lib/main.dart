import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider;
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_videos_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart'
    show DiscoverProvider;
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() {
  //Evitar landscape orientation en la app (siempre se ve vertical)
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepositry =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideosDatasourceImpl());

    return MultiProvider(
      /* or [ChangeNotifierProvider(create: (_) => DiscoverProvider()..loadNextPage()] */
      providers: [
        ChangeNotifierProvider(
            lazy:
                false, // llama al constructor inmediatamente cuando se crea la referencia al Provider
            create: (_) {
              final discoverProvider =
                  DiscoverProvider(videoPostsRepository: videoPostsRepositry);
              discoverProvider.loadNextPage();
              return discoverProvider;
            }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
