import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider;
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart'
    show DiscoverProvider;
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /* or [ChangeNotifierProvider(create: (_) => DiscoverProvider()..loadNextPage()] */
      providers: [
        ChangeNotifierProvider(
            lazy:
                false, // llama al constructor inmediatamente cuando se crea la referencia al Provider
            create: (_) {
              final discoverProvider = DiscoverProvider();
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
