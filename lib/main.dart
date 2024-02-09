import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies/core/services/theme/theme.dart';
import 'package:flutter_movies/ui/modules/main/main_paige.dart';
import 'package:flutter_movies/ui/utils/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:disposable_cached_images/disposable_cached_images.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await DisposableImages.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movies', // Flutter Movies
      theme: ThemeData(
          colorSchemeSeed: c.primary500,
          fontFamily: 'Lexend',
          useMaterial3: true,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          colorSchemeSeed: c.primary500,
          fontFamily: 'Lexend',
          useMaterial3: true,
          brightness: Brightness.dark),
      themeMode: isDark,
      home: const MainPage(),
    );
  }
}
