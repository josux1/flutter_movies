import 'package:disposable_cached_images/disposable_cached_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/ui/utils/utils.dart';

class BigImage extends StatelessWidget {
  const BigImage({super.key, required this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageHeight = size.height * 0.3;
    const String loadImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgXbnkWYNt9EqBN-GydxJ3F3j4AVeCVkwK4QCgH-GxyKJhsESmcZbLhda5sxjX_FJmYHQ&usqp=CAU';

    return SizedBox(
      height: imageHeight,
      child: Stack(
        children: [
          SizedBox(
            height: imageHeight,
            child: DisposableCachedImage.network(
              imageUrl: image != null
                  ? 'https://image.tmdb.org/t/p/original/$image'
                  : loadImage,
              onLoading: (context, height, width) =>
                  const CustomLoadingBox(height: 0.3),
              fit: BoxFit.cover,
              fadeDuration: const Duration(milliseconds: 0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Theme.of(context).scaffoldBackgroundColor,
                ])),
          )
        ],
      ),
    );
  }
}
