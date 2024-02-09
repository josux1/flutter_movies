import 'package:flutter/material.dart';
import 'package:flutter_movies/ui/utils/utils.dart';

class MoviesLoading extends StatelessWidget {
  const MoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
              height: size.height * 0.35,
              width: size.width,
              child: const CustomLoadingBox(width: 1, height: 0.35)),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.55,
                child: const CustomLoadingBox(width: 1, height: 0.05)),
          ),
          SizedBox(
            height: size.height * 0.25,
            width: size.width,
            child: ListView.separated(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Center(
                    child: SizedBox(
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                        child: const CustomLoadingBox(width: 1, height: 0.2)),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 7),
                itemCount: 5),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.55,
                child: const CustomLoadingBox(width: 1)),
          ),
          SizedBox(
            height: size.height * 0.25,
            width: size.width,
            child: ListView.separated(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Center(
                    child: SizedBox(
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                        child: const CustomLoadingBox(width: 1, height: 0.2)),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 7),
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}
