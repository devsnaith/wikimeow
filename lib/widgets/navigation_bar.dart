import 'package:flutter/material.dart';
import 'package:wikiMeow/widgets/cats_search.dart';
import 'package:wikiMeow/widgets/fav_cats.dart';
import 'package:wikiMeow/widgets/profile.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

int currentWidget = 0;
const List screens = [CatsSearch(), FavoriteCats(), ProfileWidget()];

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentWidget],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentWidget,
        onTap: (value) {
          setState(() {
            currentWidget = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
