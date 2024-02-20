import 'package:flutter/material.dart';
import 'package:wikiMeow/main.dart';
import 'package:wikiMeow/widgets/panels/CatPanelWidget.dart';

class FavoriteCats extends StatefulWidget {
  const FavoriteCats({super.key});

  @override
  State<FavoriteCats> createState() => _FavoriteCatsState();
}

class _FavoriteCatsState extends State<FavoriteCats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[50],
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                favIndexes.removeRange(0, favIndexes.length);
              });
            }),
        appBar: AppBar(
          title: const Center(
              child: Text("FavoriteCats",
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300),
            itemCount: favIndexes.length,
            itemBuilder: (context, index) {
              return Dismissible(
                  key: Key(favIndexes[index].name!),
                  child: CatPanelWidget(catModel: favIndexes[index]));
            }),
      ),
    );
  }
}
