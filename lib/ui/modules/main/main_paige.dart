import 'package:flutter/material.dart';
import 'package:flutter_movies/ui/modules/maps/maps_page.dart';
import 'package:flutter_movies/ui/modules/movies/movies_page.dart';
import 'package:flutter_movies/ui/modules/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('F. Movies')),
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: index,
        children: [
          const MoviePage(),
          MapsPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
