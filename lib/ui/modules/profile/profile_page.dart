import 'package:flutter/material.dart';
import 'package:disposable_cached_images/disposable_cached_images.dart';
import 'package:flutter_movies/core/services/assets/assets.dart';
import 'package:flutter_movies/core/services/theme/theme.dart';
import 'package:flutter_movies/ui/modules/movies/controller.dart';
import 'package:flutter_movies/ui/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Profile', style: t.title),
                CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.logo),
                )
              ],
            ),
          ),
          Divider(color: Colors.transparent),
          SwitchListTile(
              title: Text('Dark Mode', style: t.secondary),
              value: settings == ThemeMode.dark,
              enableFeedback: true,
              visualDensity: const VisualDensity(vertical: -3),
              onChanged: (value) async {
                await ref.read(themeProvider.notifier).toggleTheme();
              }),
          ListTile(
            onTap: () async {
              final messenger = ScaffoldMessenger.of(context);
              await ref
                  .read(moviesControllerProvider.notifier)
                  .deleteMoviesDB();
              messenger.showSnackBar(
                  const SnackBar(content: Text('Movies Deleted')));
            },
            title: const Text('Delete offline movies'),
            trailing: const Icon(Icons.delete),
          ),
          ListTile(
            onTap: () {
              DisposableImages.decodedImages.disposeAll();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Images Deleted')));
            },
            title: const Text('Delete cache images'),
            trailing: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
