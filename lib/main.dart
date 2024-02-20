import 'package:wikiMeow/model/cat_model.dart';
import 'package:wikiMeow/resources/cats_variable.dart';
import 'package:wikiMeow/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

final listOfCats = catsJSON.map<CatModel>((e) => CatModel.fromJson(e)).toList();
final favIndexes = <CatModel>[];

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationWidget(),
    );
  }
}
